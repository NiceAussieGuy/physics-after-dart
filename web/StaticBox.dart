
//import 'package:box2d/box2d.dart';
//import 'GameObject.dart';

part of droidtowers;

class StaticBox extends GameObject {
  
  PolygonShape shape;
  
  StaticBox(Vector size, Vector position, [double angle]) {
    if (!?angle) {
      angle = 0.0;
    }
    
    this.shape = new PolygonShape();
    this.shape.setAsBoxWithCenterAndAngle(size.x, size.y, new Vector(0, 0), angle * Game.DEGRE_TO_RADIAN);
    
//    this.activeFixtureDef = new FixtureDef();
//    this.activeFixtureDef.shape = this.shape;

    this.bodyDef = new BodyDef();
    this.bodyDef.type = BodyType.STATIC;
    this.bodyDef.position = position;

  }
  
  void addObjectToWorld(World world) {
    this.body = world.createBody(this.bodyDef);
    this.body.createFixtureFromShape(this.shape);
  }

  void draw(CanvasRenderingContext2D ctx) {
    int lineWidth = 6;
    ctx.strokeStyle = '#888';
    ctx.beginPath();
    ctx.lineWidth = lineWidth;
    
    double pos1x = (this.body.position.x + this.shape.vertices[2].x) * Game.VIEWPORT_SCALE + Game.canvasCenter.x;
    double pos1y = -(this.body.position.y + this.shape.vertices[2].y) * Game.VIEWPORT_SCALE + Game.canvasCenter.y + lineWidth/2;
    double pos2x = (this.body.position.x + this.shape.vertices[3].x) * Game.VIEWPORT_SCALE + Game.canvasCenter.x;
    double pos2y = -(this.body.position.y + this.shape.vertices[3].y) * Game.VIEWPORT_SCALE + Game.canvasCenter.y + lineWidth/2;

//    print(this.shape.vertices);
//    print("$pos1x, $pos1y, $pos2x, $pos2y");
    
    ctx.moveTo(pos1x, pos1y);
    ctx.lineTo(pos2x, pos2y);
    ctx.closePath();
    ctx.stroke();

//    this.shape.vertices.
    
//    for (int i=0; i < this.shape.vertexCount; i++) {
//      if (i == 0) {
//        ctx.moveTo(this.body.position.x - );
//      } else {
//        
//      }
//      this.shape.vertices[i];
//    }
//    print(this.shape.vertices);
//    print(this.shape.vertexCount);
//    ctx.moveTo((this.body.position.x - this.shape.) * Game.VIEWPORT_SCALE, this.body.position.y * Game.VIEWPORT_SCALE);
//    ctx.lineTo(0, 0);
//    ctx.lineTo(50, 100);
//    ctx.lineTo(0, 90);
//    ctx.closePath();
//    ctx.fill();
  }

  
}