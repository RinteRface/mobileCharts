HTMLWidgets.widget({

  name: 'mobile',

  type: 'output',

  factory: function(el, width, height) {

    var chart;

    return {

      renderValue: function(x) {

        var container = document.getElementById(el.id);
        x.opts.width = container.offsetWidth;
        x.opts.height = container.offsetHeight;

        x.opts.id = 'canvas-' + el.id;
        x.opts.pixelRatio = window.devicePixelRatio;
        chart = new F2.Chart(x.opts);

        chart.source(x.data);

        x.layers.forEach(function(layer){
          var l;
          if(layer.type == "interval")
            l = chart.interval();
          if(layer.type == "point")
            l = chart.point();
          if(layer.type == "path")
            l = chart.path();
          if(layer.type == "line")
            l = chart.line();
          if(layer.type == "area")
            l = chart.area();
          if(layer.type == "polygon")
            l = chart.polygon();
          if(layer.type == "schema")
            l = chart.schema();

          if(layer.position) l.position(layer.position);
          if(layer.color) l.color(layer.color);
          if(layer.size) l.size(layer.size);
          if(layer.shape) l.shape(layer.shape);
          if(layer.style) l.style(layer.style);
          if(layer.animate) l.animate(layer.animate);
          if(layer.adjust) l.adjust(layer.adjust);

        });

        if(x.tooltip)
          chart.tooltip(x.tooltip);

        if(x.legend)
          chart.legend(x.legend);

        if(x.scales){
          x.scales.forEach(function(scl){
            chart.scale(scl.var, scl.opts);
          })
        }

        if(x.coord)
          chart.coord(x.coord.type, x.coord.opts);

        if(x.axisHide)
          chart.axis(false);

        if(x.axis){
          x.axis.forEach(function(ax){
            chart.axis(ax.var, ax.opts);
          })
        }

        if(x.adjust)
          chart.adjust(x.adjust);

        if(x.animations){
          x.animations.forEach(function(anim){
            chart.animate(anim);
          })
        }

        chart.render();

      },

      resize: function(width, height) {
        // var canvas = chart.get('canvas');
        // canvas.changeSize(width, height);
        // chart.render();

      },
      getChart: function(){
        return chart;
      }

    };
  }
});

function get_mc_charts(id){

  var htmlWidgetsObj = HTMLWidgets.find("#" + id);

  var mc;

  if (typeof htmlWidgetsObj != 'undefined') {
    mc = htmlWidgetsObj.getChart();
  }

  return(mc);
}