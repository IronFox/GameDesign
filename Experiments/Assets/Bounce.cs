using UnityEngine;
using System.Collections;

public class Bounce : MonoBehaviour {
	
	Vector2 xy = new Vector2(0.0f,0.0f);
	
	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
		xy.x += Time.deltaTime;
		if (xy.x > 10)
			xy.x = -10;
		transform.position = new Vector3(xy.x, transform.position.y, xy.y);
	}
}
