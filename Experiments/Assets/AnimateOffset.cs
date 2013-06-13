using UnityEngine;
using System.Collections;
using System;

public class AnimateOffset : MonoBehaviour {

	public Transform	Target; 
	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
		if (Target)
			this.renderer.material.SetVector("_Offset",new Vector4(-Target.position.x,-Target.position.y,0.0f,1.0f));
		else		
			this.renderer.material.SetVector("_Offset",new Vector4((float)Math.Cos(Time.time),(float)Math.Sin(Time.time),0.0f,1.0f));
	}
}
