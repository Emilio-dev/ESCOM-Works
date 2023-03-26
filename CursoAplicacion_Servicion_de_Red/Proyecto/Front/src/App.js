import "./style.css"
import { HiArrowCircleDown } from "react-icons/hi";
import { useEffect, useRef, useState } from "react";
import { motion } from "framer-motion";

function App() {
  const [files, setFiles] = useState([])
  const file_target = useRef(null)
  const [isOn, setIsOn] = useState(false);
  const [load, setLoad] = useState(false);
  const toggleSwitch = () => {
    setIsOn(!isOn)
    //background-image:url("../public/wave.svg"); 
    document.body.setAttribute("data-ison", isOn)

  }
  const spring = {
    type: "spring",
    stiffness: 700,
    damping: 30
  };

  useEffect(() => {
    fetch('http://localhost:8080/getdata')
      .then(res => res.json())
      .then(res => setFiles(res))
      .catch((err) => console.error(err))

  }, []);
  const saveFile = () => {
    setLoad(true)
    if (file_target.current.value) {
      fetch('http://localhost:8080/uploadfile', {//?nombre=Archivo56&fecha=10/10/10
        method: "POST",
        body: JSON.stringify({ nombre: file_target.current.value, fecha: new Date(Date.now()).toLocaleDateString() }),
        headers: { "content-type": "application/json; chsrset=UTF-8" }
      })
        .then(res => res.json())
        .then(res => {
          setFiles(res)
          setLoad(false)
        })
        .catch((err) => {
          setLoad(false)
          console.error(err)
        })
    }
  }

  const downloadButton = (event, name) => {
    fetch(`http://localhost:8080/downloadFile?name=${name}`)
    .then(res => console.log(res))
    .catch(err=>console.log(err))
  }

  return (
    <div className="body" data-ison={isOn}>
      <div className="box">
        <div className={"switch"} data-ison={isOn} onClick={toggleSwitch}>
          <motion.div whileHover={{ scale: 1.2 }} className={"handle"} layout transition={spring} />
        </div>
      </div>
      <header className="title">
        <h1>SAVE YOUR FILES</h1>
      </header>
      <div>
        <section className="buttons">
          <div className="button_box">
            <div className="input-group mb-3">
              <input ref={file_target} type="file" className="form-control" id="inputGroupFile01" />
              <button type="button" className="btn btn-primary" onClick={saveFile}>Save</button>

            </div>
          </div>
        </section>
        <div style={{ display: "grid", justifyContent: "center" }}>

          {load ?
            <div class="d-flex align-items-center">
              <button class="btn btn-primary" type="button" disabled>
                <span class="spinner-grow spinner-grow-sm" role="status" aria-hidden="true"></span>
                Saving file...
              </button>
            </div> : <></>
          }
        </div>
        <section className="tabla ">
          <table className="table text-light">
            <thead className="tabla2" data-ison={isOn}>
              <tr>
                <th scope="col">Name</th>
                <th scope="col">Upload Date</th>
                <th scope="col">Download</th>
              </tr>
            </thead>
            <tbody>
              {files.length > 0 ? (files.map((file, index) => {
                let name = file.split(" ")[0]
                let date = file.split(" ")[1]
                return (
                  <tr className="tabla2" data-ison={isOn} key={index} >
                    <th className="fs-6 fw-normal" scope="col">{name}</th>
                    <th scope="col">{date}</th>
                    <td><button className={"downloadButton"} onClick={(event) => downloadButton(event, name)}><HiArrowCircleDown color={"#05be3c"} size={30} /></button></td>
                  </tr>
                )
              })) : (<></>)}

            </tbody>
          </table>
        </section>
      </div>
    </div>
  );
}

export default App;
