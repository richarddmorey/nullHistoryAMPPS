
graphics_params = list(
  general = list(
    las = 1,
    #lwd = 2,
    cex = 1.3,
    cex.axis = 1.3,
    cex.lab = 1.3,
    yaxs="i"
  ),
  one.panel = list(
    mfrow = c( 1, 1 ),
    mgp = c(2.5,1,0),
    mar = c(4,4,.75,.75)
  ),
  two.panel.cols = list(
    mfrow = c( 1, 2 ),
    mgp = c(2.5, 1, 0),
    mar = c(4,4,.75,.75)
  ),
  two.panel.rows = list(
    mfrow = c( 2, 1 ),
    mgp = c(2.5, 1, 0),
    mar = c(4,4.5,.75,.75)
  ),
  three.panel.rows = list(
    mfrow = c( 3, 1 ),
    mgp = c(2.5, 1, 0),
    mar = c(4,4.5,.75,.75)
  ),
  four.panel.rows = list(
    mfrow = c( 4, 1 ),
    mgp = c(2.5, 1, 0),
    mar = c(4,4.5,.75,.75)
  ),
  four.panel = list(
    mfrow = c( 2, 2 ),
    mgp = c(2.5, 1, 0),
    mar = c(4,4.5,.75,.75)
  ),
  three.panel.top = list(
    mgp = c(2.5, 1, 0),
    mar = c(4,4.5,.75,.75)
  )
)

do_pars = function(which){
  do.call(par, graphics_params[['general']])
  do.call(par, graphics_params[[which]])
}

rect.fill = function(at1, at2 = NULL, which = "b", ...){
  x = par()$usr[1:2]
  y = par()$usr[3:4]
  
  if(which == "b"){
    y[2] = at1      
  }else if(which == "t"){
    y[1] = at1
  }else if(which == "l"){
    x[2] = at1
  }else if(which == "r"){
    x[1] = at1
  }else if(which %in% c("mx","my")){
    if(is.null(at2)){
      stop("If which is 'mx' or 'my' (middle), at2 must be specified.")
    }
    if(which == "mx"){
      x[1] = at1
      x[2] = at2
    }else{
      y[1] = at1
      y[2] = at2      
    }
  }else{
    stop("Invalid 'which' argument.")
  }
  invisible(rect(x[1], y[1], x[2], y[2], ...))
}


