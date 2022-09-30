Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD435F2976
	for <lists+openbmc@lfdr.de>; Mon,  3 Oct 2022 09:19:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MgsfQ3Gs3z3bY8
	for <lists+openbmc@lfdr.de>; Mon,  3 Oct 2022 18:19:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=verizon.com header.i=@verizon.com header.a=rsa-sha256 header.s=corp header.b=gbyFSMhF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=verizon.com (client-ip=148.163.153.92; helo=mx0b-0024a201.pphosted.com; envelope-from=mruthyunjaya.rao.havaligi@verizon.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=verizon.com header.i=@verizon.com header.a=rsa-sha256 header.s=corp header.b=gbyFSMhF;
	dkim-atps=neutral
X-Greylist: delayed 2833 seconds by postgrey-1.36 at boromir; Sat, 01 Oct 2022 04:52:27 AEST
Received: from mx0b-0024a201.pphosted.com (mx0b-0024a201.pphosted.com [148.163.153.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MfK976D5gz3c61
	for <openbmc@lists.ozlabs.org>; Sat,  1 Oct 2022 04:52:23 +1000 (AEST)
Received: from pps.filterd (m0098282.ppops.net [127.0.0.1])
	by mx0a-0024a201.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28UFn1GS008172
	for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2022 14:05:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verizon.com; h=mime-version : from
 : date : message-id : subject : to : content-type; s=corp;
 bh=HiR1tX3Orq60SHxFQIezp9CXrFaeoHP1LERmy9l7DJc=;
 b=gbyFSMhFFoFoQ0d+i2zCGcEZZiHlFXP1fqQO8kxbxVJ+RUFG58MQd+LiTyt89K8ULBZH
 9rZORqBtOvGsNxx3911v5NqAqgdBfu2EkmyRyXsOaLY/fEFudMJFyKFCZXkiojEGTAgz
 Q3xL+sT22o0XTwcLFi+Un5JoiOuHHt/ajoY= 
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0024a201.pphosted.com (PPS) with ESMTPS id 3jwk3n1s55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2022 14:05:05 -0400
Received: by mail-pf1-f199.google.com with SMTP id z6-20020aa78886000000b005470014dc57so3164418pfe.1
        for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2022 11:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=HiR1tX3Orq60SHxFQIezp9CXrFaeoHP1LERmy9l7DJc=;
        b=6aGArdh1jPlk3NKaKhFa/3vzm+pvPZ4dAnAz0ZIlx5z/6OETM+jb6JjW/CP/bt8Kw/
         032lhqhAM3uWgQSumbkfRKdTAlzvoK27HsEAShjyuI0oNuPEJdvJlBvCygFstinXOb5h
         xHZL0kS7HBV7Sj+yxZf8JxQUu+Ol5vSL6tA5dw97Vxo0p2fN4/LODDO83heGJz2+OBpi
         BALoXM3h7Ca97To4zqTVg6snegsGNXddrR31CIO+04gsDQnPCaMxrGq9dVWMI6WNNm0s
         jm0Mt9/AvpcN+w6NQEKxwCZYvjHwoG1Q92zxCu8cLiBTRQR9CP2H1VuZxYoV8TP2vEyx
         U8qg==
X-Gm-Message-State: ACrzQf3YKo4XgRuCYElQGBnntoEys1t0J47+n4Tn3GFGxrNWvAz1RgqN
	WJ8hWgspQRzpK7iustGZ+PqHEPmC3gnUpel+8hQaPTY34YTfs4W4K3uCFJfQj/2ALbj78HDlIU0
	yYnXYIkA1nmEHtQASCQRSj0X/JuSONhWJajo=
X-Received: by 2002:a63:441b:0:b0:439:103b:25a4 with SMTP id r27-20020a63441b000000b00439103b25a4mr8333423pga.487.1664561103382;
        Fri, 30 Sep 2022 11:05:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6b1ouyfLuEztIH+bYQVYSRGZ1SKIxKxaYCLqII8FgXgPp8q1JeSqPTkwQHItnnMNxorMLaAQsJfA8bwru4pYo=
X-Received: by 2002:a63:441b:0:b0:439:103b:25a4 with SMTP id
 r27-20020a63441b000000b00439103b25a4mr8333374pga.487.1664561102607; Fri, 30
 Sep 2022 11:05:02 -0700 (PDT)
MIME-Version: 1.0
From: "Havaligi, Mruthyunjaya Rao (Jay)" <mruthyunjaya.rao.havaligi@verizon.com>
Date: Fri, 30 Sep 2022 14:04:50 -0400
Message-ID: <CAO4fCV5bieMHTmcO=G0zWR26B1kJ9U=H3HUpNpNWh+VN7BOsbg@mail.gmail.com>
Subject: How to stream Name and Reading using streaming telemetry
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000003a754305e9e8d564"
X-mailroute: internal
X-Proofpoint-ORIG-GUID: n5Jo_KntThS92KI179XPDZMz00EKW7tX
X-Proofpoint-GUID: n5Jo_KntThS92KI179XPDZMz00EKW7tX
X-Mailman-Approved-At: Mon, 03 Oct 2022 18:17:26 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000003a754305e9e8d564
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I am trying to setup streaming telemetry on OpenBmc and I am not able to
create a metric report if I use a string value as part of the metric report
definition as shown below:


      "@odata.id": "/redfish/v1/Chassis/AC_Baseboard/Power#/Voltages/16",
      "@odata.type": "#Power.v1_0_0.Voltage",
      "LowerThresholdCritical": 0.729,
      "LowerThresholdNonCritical": 0.752,
      "MaxReadingRange": 2.4140596060291633,
      "MemberId": "PVCCINFAON_CPU2",
      "MinReadingRange": 0.0,
      "Name": "PVCCINFAON CPU2",
      "ReadingVolts": 1.0583,

I am trying to stream the orange fields together with the metric report def
below:

 POST https://$BMCIP/redfish/v1/TelemetryService/MetricReportDefinitions -H
"Content-Type: application/json"  -d
'{"Id":"Temperatures","Metrics":[{"MetricId":"tempeadings","MetricPropertie=
s":["/redfish/v1/Chassis/AC_Baseboard/Thermal#/Temperatures/1/Name","/redfi=
sh/v1/Chassis/AC_Baseboard/Thermal#/Temperatures/1/ReadingCelsius"]}],"Metr=
icReportDefinitionType":"Periodic","ReportActions":["RedfishEvent"],"Schedu=
le":{"RecurrenceInterval":"PT0H5M0S"}}'
{
  "MetricProperties/0@Message.ExtendedInfo": [
    {
      "@odata.type": "#Message.v1_1_1.Message",
      "Message": "The value
/redfish/v1/Chassis/AC_Baseboard/Thermal#/Temperatures/1/Name for the
property MetricProperties/0 is not in the list of acceptable values.",
      "MessageArgs": [
        "/redfish/v1/Chassis/AC_Baseboard/Thermal#/Temperatures/1/Name",
        "MetricProperties/0"
      ],
      "MessageId": "Base.1.8.1.PropertyValueNotInList",
      "MessageSeverity": "Warning",
      "Resolution": "Choose a value from the enumeration list that the
implementation can support and resubmit the request if the operation
failed."
    }
  ]

The metric report is created if I remove the Name field. The issue is that
without the name of the sensor, the collecting system will not have any way
to associate the sensor name and its value. How do I get this working?


Thanks,
Jay

--0000000000003a754305e9e8d564
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I am trying to setup=C2=A0streaming=
 telemetry on OpenBmc and I am not able to create a metric report if I use =
a string value as part of the metric report definition as shown below:<div =
dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><d=
iv dir=3D"ltr"><div><div></div></div></div></div><input name=3D"virtru-meta=
data" type=3D"hidden" value=3D"{&quot;email-policy&quot;:{&quot;disableCopy=
Paste&quot;:false,&quot;disablePrint&quot;:false,&quot;disableForwarding&qu=
ot;:false,&quot;enableNoauth&quot;:false,&quot;expandedWatermarking&quot;:f=
alse,&quot;expires&quot;:false,&quot;sms&quot;:false,&quot;expirationNum&qu=
ot;:1,&quot;expirationUnit&quot;:&quot;days&quot;,&quot;isManaged&quot;:fal=
se,&quot;persistentProtection&quot;:false},&quot;attachments&quot;:{},&quot=
;compose-id&quot;:&quot;4&quot;,&quot;compose-window&quot;:{&quot;secure&qu=
ot;:false}}"></div><div><br></div><div><br class=3D"gmail-Apple-interchange=
-newline">=C2=A0 =C2=A0 =C2=A0 &quot;@<a href=3D"http://odata.id/" target=
=3D"_blank">odata.id</a>&quot;: &quot;/redfish/v1/Chassis/AC_Baseboard/Powe=
r#/Voltages/16&quot;,<br>=C2=A0 =C2=A0 =C2=A0 &quot;@odata.type&quot;: &quo=
t;#Power.v1_0_0.Voltage&quot;,<br>=C2=A0 =C2=A0 =C2=A0 &quot;LowerThreshold=
Critical&quot;: 0.729,<br>=C2=A0 =C2=A0 =C2=A0 &quot;LowerThresholdNonCriti=
cal&quot;: 0.752,<br>=C2=A0 =C2=A0 =C2=A0 &quot;MaxReadingRange&quot;: 2.41=
40596060291633,<br>=C2=A0 =C2=A0 =C2=A0 &quot;MemberId&quot;: &quot;PVCCINF=
AON_CPU2&quot;,<br>=C2=A0 =C2=A0 =C2=A0 &quot;MinReadingRange&quot;: 0.0,<b=
r>=C2=A0 =C2=A0 =C2=A0 &quot;<font color=3D"#ff9900">Name</font>&quot;: &qu=
ot;PVCCINFAON CPU2&quot;,<br>=C2=A0 =C2=A0 =C2=A0 &quot;<font color=3D"#ff9=
900">ReadingVolts</font>&quot;: 1.0583,<br></div><div><br></div><div>I am t=
rying to stream the orange fields together with the metric report=C2=A0def =
below:</div><div><br></div><div>=C2=A0POST https://$BMCIP/redfish/v1/Teleme=
tryService/MetricReportDefinitions -H &quot;Content-Type: application/json&=
quot; =C2=A0-d &#39;{&quot;Id&quot;:&quot;Temperatures&quot;,&quot;Metrics&=
quot;:[{&quot;MetricId&quot;:&quot;tempeadings&quot;,&quot;MetricProperties=
&quot;:[&quot;/redfish/v1/Chassis/AC_Baseboard/Thermal#/Temperatures/1/Name=
&quot;,&quot;/redfish/v1/Chassis/AC_Baseboard/Thermal#/Temperatures/1/Readi=
ngCelsius&quot;]}],&quot;MetricReportDefinitionType&quot;:&quot;Periodic&qu=
ot;,&quot;ReportActions&quot;:[&quot;RedfishEvent&quot;],&quot;Schedule&quo=
t;:{&quot;RecurrenceInterval&quot;:&quot;PT0H5M0S&quot;}}&#39;<br>{<br>=C2=
=A0 &quot;MetricProperties/0@Message.ExtendedInfo&quot;: [<br>=C2=A0 =C2=A0=
 {<br>=C2=A0 =C2=A0 =C2=A0 &quot;@odata.type&quot;: &quot;#Message.v1_1_1.M=
essage&quot;,<br>=C2=A0 =C2=A0 =C2=A0 &quot;Message&quot;: &quot;The value =
/redfish/v1/Chassis/AC_Baseboard/Thermal#/Temperatures/1/Name for the prope=
rty MetricProperties/0 is not in the list of acceptable values.&quot;,<br>=
=C2=A0 =C2=A0 =C2=A0 &quot;MessageArgs&quot;: [<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;/redfish/v1/Chassis/AC_Baseboard/Thermal#/Temperatures/1/Name&quo=
t;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;MetricProperties/0&quot;<br>=C2=A0=
 =C2=A0 =C2=A0 ],<br>=C2=A0 =C2=A0 =C2=A0 &quot;MessageId&quot;: &quot;Base=
.1.8.1.PropertyValueNotInList&quot;,<br>=C2=A0 =C2=A0 =C2=A0 &quot;MessageS=
everity&quot;: &quot;Warning&quot;,<br>=C2=A0 =C2=A0 =C2=A0 &quot;Resolutio=
n&quot;: &quot;Choose a value from the enumeration list that the implementa=
tion can support and resubmit the request if the operation failed.&quot;<br=
>=C2=A0 =C2=A0 }<br>=C2=A0 ]<br></div><div><br></div><div>The=C2=A0metric r=
eport is created if I remove the Name field. The issue is that without the =
name of the sensor, the collecting system will not have any way to associat=
e the sensor name and its value. How do I get this working?</div><div><br><=
/div><div><br></div><div>Thanks,</div><div>Jay</div><div><br></div></div>

--0000000000003a754305e9e8d564--
