import { useState } from "react";

export default function Home() {
  const [studentId, setStudentId] = useState("");
  const [result, setResult] = useState(null);

  const handleSearch = async () => {
    try {
      const response = await fetch(`http://localhost:8000/students/${studentId}`);
      if (response.ok) {
        const data = await response.json();
        setResult(data);
      } else {
        setResult(null);
        alert("Student not found!");
      }
    } catch (error) {
      console.error("Error fetching student data:", error);
      alert("Failed to fetch student data. Please try again later.");
    }
  };

  return (
    <div style={{ padding: "20px", fontFamily: "Arial" }}>
      <h1>Search Student</h1>
      <input
        type="text"
        placeholder="Enter student ID"
        value={studentId}
        onChange={(e) => setStudentId(e.target.value)}
        style={{ padding: "10px", marginRight: "10px" }}
      />
      <button onClick={handleSearch} style={{ padding: "10px" }}>
        Search
      </button>
      {result && (
        <div style={{ marginTop: "20px" }}>
          <h2>Student Info</h2>
          <p>ID: {result.id}</p>
          <p>Name: {result.name}</p>
          <p>Class: {result.class_name}</p>
          <p>Score: {result.score}</p>
        </div>
      )}
    </div>
  );
}