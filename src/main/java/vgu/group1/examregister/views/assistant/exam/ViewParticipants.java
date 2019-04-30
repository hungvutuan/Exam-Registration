package vgu.group1.examregister.views.assistant.exam;


import vgu.group1.examregister.database.AccessDatabase;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.sql.SQLException;

/**
 * Root resource (exposed at "/example" path)
 */
@Path("/assistant/exam/viewparticipants")
public class ViewParticipants {


    /**
     * Method handling HTTP GET requests. The returned object will be sent
     * to the client as "text/plain" media type.
     *
     * @return String that will be returned as a text/plain response.
     */
    @Produces(MediaType.APPLICATION_JSON)
    @GET
    public Response viewParticipants() throws SQLException {
        int examID = 1;
        return Response.ok(AccessDatabase.listParticipants(examID).toString(), MediaType.APPLICATION_JSON).build();
    }
}