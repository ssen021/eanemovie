package com.induk.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Getter @Setter
public class HistoryUrl {
    private String historyUrl = "";
    private String historyParam = "";


    public String getParam() throws UnsupportedEncodingException {
        String url = "historyUrl=" + URLEncoder.encode(historyUrl, "UTF-8")
                + "&historyParam=" + URLEncoder.encode(historyParam, "UTF-8");
        return url;
    }
    public String getURL() throws UnsupportedEncodingException {
        String paramUrl = "";
        if(!historyParam.isEmpty() && historyParam != "") {
            String[] paramSpl = historyParam.split("&");
            for (String params : paramSpl) {
                String[] param = params.split("=");
                if (!param[0].isEmpty()) paramUrl += param[0] + "=";
                if (!param[1].isEmpty()) paramUrl += URLEncoder.encode(param[1], "UTF-8") + "&";
            }
        }
        else return  historyUrl;
        return historyUrl + "?" + paramUrl;
    }
}
