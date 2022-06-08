Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0EF543FDA
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 01:26:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJNfS68GLz3brR
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 09:26:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kk0aNsvj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=jfriedman.seattle@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kk0aNsvj;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJFXw6GLMz3bm5
	for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2022 04:06:39 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id gc3-20020a17090b310300b001e33092c737so18997427pjb.3
        for <openbmc@lists.ozlabs.org>; Wed, 08 Jun 2022 11:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:from:mime-version:date:subject:message-id
         :references:to;
        bh=sIRVzNeD+j/JWJw38xVTDci80+4n+yuATcLxwMmcSiw=;
        b=kk0aNsvj1jvpo/13Zc8nniBTqRyFcsw6L+md+ZsNmV85dQhbnNciMMSmGEE4jA9mXB
         RVn65Bh2xO7sYTONoEh/KdpvffOkqvKChqXM46RxbK5fKzKKzrLhyKVqz7LTcsoITKi6
         pzLVYQbaLOLoa7yxLHaSGKhuNVZrHYs2/k4FBalpCne/0GUfrdTuP3YEMuKc4RZC4/+S
         hxrCSlDTzNAnhrrvIuRRr/8wb6cx8TSQT7ErTKTVWMZ7OFux/yRw9/AD+DglhT2urEIF
         LUOf5pVSM+sLcOQ1jfjWSyMEg27T+dLnQhYSAPJEBEWNzuysGcEXXn526ACAcGRA8i9f
         hing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version:date
         :subject:message-id:references:to;
        bh=sIRVzNeD+j/JWJw38xVTDci80+4n+yuATcLxwMmcSiw=;
        b=Hj2Fbr/B2I374UE7fN9IqUg8PsmxAfa9vDcB3F6voZQhz7XIrlR4CuCO8ZugHihh49
         qCSHtolomAmHeWwTs6mlbN73+WM4dhtdWxpLLus6GElZ+kqPuwbQEz44cAQYKnIDeOba
         /4AQ9siyl5F6y+ZK9rFKKwKvgV3TGuzIdRLzxXSjBeFl0bHxILAX2VvWKjh2jUskDm3b
         8000SfVXE6rqEyi/P9SajG5zNXPM7+xSc66NrnjNFON0ZYFH4jAOR5ASwfVjQkltV3By
         n+Z6zxGsGbkCx1hOyLIrvzi1t4I+fW6SW6nzS0qPG6ck8oDoPFLLN+jZe8QTS0XZvl7d
         lmUw==
X-Gm-Message-State: AOAM533ZG0MMY+lTh0Ys9XV/E+2S8Slx4UheZCpKWnO9MBFRqEu9qEkR
	oK5oZFx5PD7E+bf+WaqzWVFd5K3t0Zs=
X-Google-Smtp-Source: ABdhPJyHOkvGhavroBCvsguhUAmEm5t0M5oCxaEkDa0LjAHtcr2+XqlOwOdZPqIAHsCaJcCpS2qHDg==
X-Received: by 2002:a17:90b:33c5:b0:1e3:e57a:8998 with SMTP id lk5-20020a17090b33c500b001e3e57a8998mr443165pjb.54.1654711595478;
        Wed, 08 Jun 2022 11:06:35 -0700 (PDT)
Received: from smtpclient.apple ([2600:100f:b072:b927:dddb:7b09:22db:876f])
        by smtp.gmail.com with ESMTPSA id cj10-20020a056a00298a00b0051bd72bb2e6sm12260417pfb.197.2022.06.08.11.06.34
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 11:06:35 -0700 (PDT)
Content-Type: multipart/alternative; boundary=Apple-Mail-97F94761-2E96-4725-A2BA-8D6E928603BF
Content-Transfer-Encoding: 7bit
From: Jeff Friedman <jfriedman.seattle@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 8 Jun 2022 11:06:33 -0700
Subject: Newbie question on Redfish URI resource names
Message-Id: <F28E886F-23E1-467B-AA9E-C2C46C837B15@gmail.com>
References: <790233eae1974b409954c837ccbfbaad@ztsystems.com>
To: openbmc@lists.ozlabs.org
X-Mailer: iPhone Mail (19F77)
X-Mailman-Approved-At: Thu, 09 Jun 2022 09:26:36 +1000
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


--Apple-Mail-97F94761-2E96-4725-A2BA-8D6E928603BF
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hello all,
=20
New to OpenBMC, and am not clear on one thing as pertaining to the Redfish s=
chema and URI resource names:
=20
The DMTF Redfish schema URIs are defined as:
=20
/redfish/v1/Chassis/{ChassisId}/
/redfish/v1/Managers/{ManagerId}
/redfish/v1/Systems/{ComputerSystemId}
=20
Vendors can use their own names for {ChassisId}, {ManagerId}, and {ComputerS=
ystemId} as long as they conform to the syntax rules.
=20
Question: Does OpenBMC specify names for these resources as part of the Open=
BMC spec? Or does OpenBMC just refer to the existing DMTF Redfish schemas?
=20
I ask because I have seen reference to the following names in examples for M=
anagers and Systems on the OpenBMC website:
=20
/redfish/v1/Chassis/{ChassisId}/              =20
/redfish/v1/Managers/bmc/                                                   =
  =20
/redfish/v1/Systems/system/   =20
=20
In summary, does OpenBMC specify these resource names as part of their spec,=
 or does it refer to existing DMTF Redfish schema specs?
=20
Thank you!
=20
Jeff Friedman
Sr. Field Systems Engineer | ZT Systems
M: 206.819.2824

<image001.gif>


This email and any files transmitted with it are privileged/confidential and=
 intended solely for the use of the individual to whom they are addressed. I=
f you have received this email in error, you are not authorized to distribut=
e it in whole or in part. This communication does not constitute a contract o=
ffer, amendment, or acceptance of a contract offer, unless explicitly stated=
.=20

=20=

--Apple-Mail-97F94761-2E96-4725-A2BA-8D6E928603BF
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head><meta http-equiv="content-type" content="text/html; charset=utf-8"></head><body dir="auto"><div dir="ltr"></div><div dir="ltr"><span style="font-family: Calibri, sans-serif; font-size: 11pt;">Hello all,</span></div><div dir="ltr"><div class="WordSection1"><p class="MsoNormal"><o:p></o:p></p>
<p class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p class="MsoNormal">New to OpenBMC, and am not clear on one thing as pertaining to the Redfish schema and URI resource names:<o:p></o:p></p>
<p class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p class="MsoNormal">The DMTF Redfish schema URIs are defined as:<o:p></o:p></p>
<p class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p class="MsoNormal">/redfish/v1/Chassis/{ChassisId}/<o:p></o:p></p>
<p class="MsoNormal">/redfish/v1/Managers/{ManagerId}<o:p></o:p></p>
<p class="MsoNormal">/redfish/v1/Systems/{ComputerSystemId}<o:p></o:p></p>
<p class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p class="MsoNormal">Vendors can use their own names for {ChassisId}, {ManagerId}, and {ComputerSystemId} as long as they conform to the syntax rules.
<o:p></o:p></p>
<p class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p class="MsoNormal">Question: Does OpenBMC specify names for these resources as part of the OpenBMC spec? Or does OpenBMC just refer to the existing DMTF Redfish schemas?<o:p></o:p></p>
<p class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p class="MsoNormal">I ask because I have seen reference to the following names in examples for Managers and Systems on the OpenBMC website:<o:p></o:p></p>
<p class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p class="MsoNormal">/redfish/v1/Chassis/{ChassisId}/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></p>
<p class="MsoNormal">/redfish/v1/Managers/<b><i>bmc</i></b>/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class="MsoNormal">/redfish/v1/Systems/<b><i>system</i></b>/&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></p>
<p class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p class="MsoNormal">In summary, does OpenBMC specify these resource names as part of their spec, or does it refer to existing DMTF Redfish schema specs?<o:p></o:p></p>
<p class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p class="MsoNormal">Thank you!<o:p></o:p></p>
<p class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p class="MsoNormal"><b><span style="color:#DF4826">Jeff Friedman</span></b><span style="font-size:9.0pt;color:#1F497D"><br>
</span><span style="font-size:9.0pt;color:gray">Sr. Field Systems Engineer | ZT Systems</span><span style="font-size:9.0pt;color:#44546A"><o:p></o:p></span></p>
<p class="MsoNormal" style="margin-bottom:12.0pt"><span style="font-size:9.0pt;color:#7F7F7F">M: 206.819.2824<o:p></o:p></span></p>
<p class="MsoNormal" style="margin-bottom:12.0pt"><a href="http://www.ztsystems.com/"><span style="font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:#4A58AB;text-decoration:none"><div>&lt;image001.gif&gt;</div></span></a><span style="font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:#6D6E71"><br>
<br>
</span><span style="font-size:7.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#7F7F7F">This email and any files transmitted with it are privileged/confidential and intended solely for the use of the individual to whom they are addressed. If you have received this
 email in error, you are not authorized to distribute it in whole or in part. This communication does not constitute a contract offer, amendment, or acceptance of a contract offer, unless explicitly stated.</span><span style="font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:#6D6E71">&nbsp;</span><o:p></o:p></p>
<p class="MsoNormal"><o:p>&nbsp;</o:p></p>
</div>


</div><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style></body></html>
--Apple-Mail-97F94761-2E96-4725-A2BA-8D6E928603BF--
