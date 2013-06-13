using UnityEngine;
using System.Collections;

public class test : MonoBehaviour {

	float angle = 0;
	public Transform Target;
		float h; 
	// Use this for initialization
	void Start () {
		h = Target.position.y;
	}
	
	// Update is called once per frame
	void Update () {
		angle += Time.deltaTime;
		transform.rotation = Quaternion.Euler(0,angle*100.0f,0);
		Vector3 pos = transform.position;
		pos = Target.position - transform.forward * 10.0f;
		pos.y = h;
		transform.position = pos;
	}
}
