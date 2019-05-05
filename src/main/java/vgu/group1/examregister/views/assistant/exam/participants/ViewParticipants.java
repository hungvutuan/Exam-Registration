package vgu.group1.examregister.views.assistant.exam.participants;

import org.json.JSONArray;
import vgu.group1.examregister.database.Exam;
import vgu.group1.examregister.views.BaseView;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.io.IOException;
import java.sql.SQLException;

@Path("/assistant/exam/{id}/participants")
public class ViewParticipants extends BaseView {
    /**
     * Method handling HTTP GET requests. The returned object will be sent
     * to the client as "text/plain" media type.
     *
     * @return String that will be returned as a text/plain response.
     */
    @GET
    @Produces(MediaType.TEXT_HTML)
    public Response doGet() throws IOException {
        return Response.ok(getHTMLFile("view_exam_participants.html")).build();
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response doPost(@PathParam("id") int examID)
            throws SQLException {
        JSONArray participants = Exam.listParticipants(examID);
        return Response.ok(participants.toString()).build();
    }
}