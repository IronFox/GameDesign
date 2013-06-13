using UnityEngine;
using System.Collections;
using System;

public class test2 : MonoBehaviour {
	
	float h;
	// Use this for initialization
	void Start () {
		h = transform.position.y;
	}
	
	// Update is called once per frame
	void Update () {
		Vector3 scale = transform.localScale;
		scale.y = 1.0f + 0.5f * (float)Math.Sin(Time.time);
		transform.localScale = scale;
		Vector3 pos = transform.position;
		pos.y = h + (float)Math.Abs(Math.Sin(Time.time));
		transform.position = pos;
	}
}
