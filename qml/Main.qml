/*
 * Copyright (C) 2020  Your FullName
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * ubuntu-calculator-app is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
import Ubuntu.Components 1.3
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import QtQuick.Window 2.2


MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'pixel.luca.innocenti'
    automaticOrientation: true

    width: Screen.width
    height: Screen.height

    Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('Mandelbrot QML')
        }

	Canvas {
	id: canvas
	width:  Screen.width
	height:  Screen.height
  	onPaint: {
      		var context=canvas.getContext("2d")
           context.fillStyle="rgb(0,0,0)";
           context.fillRect(0, 0, width, height);
           var re_min = -2.0;
           var im_min = -1.2;
           var re_max = 0.7;
           var im_max = 1.2;
           var iterazioni = 25;
           var colori = ["#FFFFFF","#FF0000","#00FF00","#0000FF","#FF00FF","#FFFF00","#00FFFF","#FFaa00","#abcedf","#fedc0a","#ab16dd","#d00fba","#edabcc","#ddacff"];

           var r;
           var a,b;
           var x,y,x_new,y_new;
           var test;
           var k,j,i;
           var re_factor = (re_max-re_min);
           var im_factor = (im_max-im_min);
           for (var i=0;i<width;i++)
            {
            for (var j=0;j<height;j++)
             {
                 a = re_min+(j*re_factor/height);
                 b = im_min+(i*im_factor/width);
                 x = 0;
                 y = 0;
                 test = 0;
                 for (var k=0;k<iterazioni;k++)
                      {
                      x_new = (x*x)-(y*y)+a;
                      y_new = (2*x*y)+b;
                      if (((x_new*x_new)+(y_new*y_new))>4)
                            {
                              // colora il punto
                              r = k%12;
                              context.beginPath();
                              context.fillRect(i-1,j-1,1,1);
                              context.fillStyle=colori[r];
                              context.stroke();
                              break;
                            }
                      x = x_new;
                      y = y_new;
                      }
             }
           }
      		}
}
}
}
