Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DC8A212D1
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2025 21:02:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjGRF2DN2z3bcX
	for <lists+openbmc@lfdr.de>; Wed, 29 Jan 2025 07:02:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738094550;
	cv=none; b=GW64d1SA2245LCFTjVDM3D3j9PcHTG/PG+xw9OrhfRzn6Gz6sMoi5/imAoubi0/Ay21k6hRHbBot1u0hEyiS3LmdIv77XgZLTMfGX4qQ1OSbdktnFvEu4VOXSyhw1yGzvF2pnc4gbbiG41VwwLzC/Rrdzz9rcroM0g80avgNJ0momZlidB0wFFvBpNa0VuUKA83B0tXvrrY5Pg2znU24HnM0Ov6PsTQGGqvxHjB25xoZi/nENuZgHD50e3CryNRKHaUrcMkCfSSG0IiErR/doJBdDHUJLq8+/pdD2uci9ihCvnKHJQ56uO9dJaOJZDTIIjTZkgLzmAa30B59n+Diow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738094550; c=relaxed/relaxed;
	bh=v99EarhVsIPWH/Kg5o7A8TgYVBbVCeOnuVlqxf35RTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=CJm/mnoUgjAmwUZgJfeLxZSHfgYUhh8Jvlsg8Emwld2Ei7LqR52aFdi17u+dkoeWCi29PI/Zxhfn5iwLUTNP/8owJugDZP2zaLzv/hkbrgSyY/buTonjihgX+EPKpfogTBk9npZht31/UknYn4pzhK4ZLa1j0sPPeGxJ8D2YehPbAsjJzzEYmUfFVXvuSwvmTZig+wy4VdztnNnZuckDBWJxVx+Ez5RN2c1I03hnl1wi9YW/2DchhfRNnQGrMo3Fb/VnF/USIbK5yw5xqQ7mh/4eHASbrHSZgcflhrM7z81KUQVNm+HEh/giFJvCpxzbdNRdT+dWiS7bhLGAt7ZYwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Wmz947Ym; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=woodwardm@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Wmz947Ym;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=woodwardm@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjGR94pxqz30K6
	for <openbmc@lists.ozlabs.org>; Wed, 29 Jan 2025 07:02:29 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21625b4f978so181025ad.0
        for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2025 12:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738094546; x=1738699346; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v99EarhVsIPWH/Kg5o7A8TgYVBbVCeOnuVlqxf35RTQ=;
        b=Wmz947YmLCDMQcLQakB6oZm0UFkbUbyhd4/ItT5ZKVtSD1P7oN8QlgVcDkKMK6NGYP
         56CkBsJll3pJgBF/Rj2MhFBOtSNnJK2FxCe2m4uOwfHVQEGx6WKmTllmq9+oYRfBAFfa
         b3kCVGpPFUvKTrUuXCeghEnQKjDLjVRy8kYIUAEfppfuaepH/X+gFw+qiXjDoBsJSt+O
         jJED0yEtH++X0ZfNV7wy2Y8+RdLXfC6Y6NvccNed0JWUWSNWrtXMDoqDdgvQ3qcASDU/
         D1h5P3XM2M9Z9cvn/w3QV8Ci/cqWV2z4xQ0sd0B6WIxZnBP1jyBvNuBMBwfPPU+sqzVF
         Jwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738094546; x=1738699346;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v99EarhVsIPWH/Kg5o7A8TgYVBbVCeOnuVlqxf35RTQ=;
        b=oJEaDly5keAXghhXz+alsxb40yvqR0L7oLHpx3FM8wARxIzdYS6g3lHvOYhg0hsUve
         KoPCtiTHVi8KoJ//LRYok4+uqEHfA6UGP/0XPeqqtAgEzwJ3Wb0BPY7DLuQhf5IbVCg5
         HUN1tafVfZgUUun4E6X427mxWumrYKXZmyO2nBN+waCFdLY3FPhFcfe5Kfd+aYkM32Ol
         eYr66+81tlCeekutg53v2GNGp6zQVPj6CgYo8COLyGuLZW8GLbAHfnB+kWnte3w27AWe
         VtsWF0+mdMR8rcW0Pg3YT/dHPCgauoJervLJixq3oe1YKehJX7vGpx+WMzYtN1My6VKp
         UdpQ==
X-Gm-Message-State: AOJu0YxeHv263UmPFj1CMJ8wpf86yzKBrg23dT9sQXrXtjzm7MWm/0vw
	jnsc7RZIKf7zBxr/ee9TzsxsBBqClIKtCWHnkqsZdk86Iwv+POz16qqelN1rfQLFF8FC5vgpWOX
	Gf+YkYsFMY61mSf4XPEVCHM3GG7M8iw5iRCjidGi4veisZzK7TJwe
X-Gm-Gg: ASbGncs/RvmMStgi4Fn0XtrtGWoWCvV215/PwW0eH65zoG7KbFD3eHHJLqSOpk8AWzX
	cuhxMzCd+mHMk1LGP2dKGwnhBEGb7ySa5OkFzE3pfIyT4dnYm7PjnDuAA1hDjGgQjJSQztc6jNW
	ri/gKJte6RBJDqc8svwcbNeDs1hA==
X-Google-Smtp-Source: AGHT+IGzWAOWuqulYFhvx6YXtsotz6gbuAYio5s457UZQmtFHPuwkiKSIP1PZGhM7P4kTAgFXrmKcCIgNFKvB+sINwE=
X-Received: by 2002:a17:903:40c9:b0:21b:b2a4:9476 with SMTP id
 d9443c01a7336-21dd80915ecmr303815ad.20.1738094544087; Tue, 28 Jan 2025
 12:02:24 -0800 (PST)
MIME-Version: 1.0
References: <CAE0x3M=FXi+KWuMXjRH38zSeE3==0ALtCHemn4DCxdwU-S=jCg@mail.gmail.com>
In-Reply-To: <CAE0x3M=FXi+KWuMXjRH38zSeE3==0ALtCHemn4DCxdwU-S=jCg@mail.gmail.com>
From: Mark Woodward <woodwardm@google.com>
Date: Tue, 28 Jan 2025 15:02:11 -0500
X-Gm-Features: AWEUYZmTXSxOg2-SrdQeduH-5HnNhmpK5yPB43AxwkOIK4LI4PUDhdcce7SXPbs
Message-ID: <CAE0x3M=AMwffqL07xeK+jLv8n49PnPkMFeLDfvAy5EbeNmFXSA@mail.gmail.com>
Subject: Re: PSUSensor.cpp - Removed PSU
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000e3f31c062cc9abbb"
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

--000000000000e3f31c062cc9abbb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Here is a diff

diff --git a/src/PSUSensor.cpp b/src/PSUSensor.cpp
index e454c74..4072e07 100644
--- a/src/PSUSensor.cpp
+++ b/src/PSUSensor.cpp
@@ -133,6 +133,31 @@ void PSUSensor::deactivate()
     i2cDevice =3D nullptr;
     path =3D "";
 }
+bool PSUSensor::readStatusClearValue(bool success)
+{
+    bool result =3D false;
+    if(success)
+    {
+        lastClear =3D 0;
+    }
+    else
+    {
+        unsigned int now =3D (unsigned int) time(0);
+        if(lastClear =3D=3D 0)
+        {
+            lastClear =3D now;
+        }
+        else
+        {
+            if((now - lastClear) > timeout_before_clear)
+            {
+                result =3D true;
+                lastClear =3D 0;
+            }
+        }
+    }
+    return result;
+}

 void PSUSensor::setupRead(void)
 {
@@ -214,12 +239,19 @@ void PSUSensor::handleResponse(const
boost::system::error_code& err,
     {
         if (readingStateGood())
         {
-            std::cerr << name << " read failed\n";
+            std::cerr << name << " read failed:" << err << "\n";
+            if(readStatusClearValue(false))
+            {
+                std::cerr << name << " clearing value" << "\n";
+                updateValue(0 + sensorOffset);
+            }
         }
         restartRead();
         return;
     }

+    readStatusClearValue(true);
+
     // null terminate the string so we don't walk off the end
     std::array<char, 128>& bufferRef =3D *buffer;
     bufferRef[bytesRead] =3D '\0';
diff --git a/src/PSUSensor.hpp b/src/PSUSensor.hpp
index b49235f..a7ee95d 100644
--- a/src/PSUSensor.hpp
+++ b/src/PSUSensor.hpp
@@ -61,6 +61,16 @@ class PSUSensor : public Sensor, public
std::enable_shared_from_this<PSUSensor>

     static constexpr size_t warnAfterErrorCount =3D 10;

+    // Wait timeout_before_clear (5 minutes)
+    static constexpr unsigned int timeout_before_clear =3D 300;
+
+    // Time of last clear
+    unsigned int lastClear;
+
+    // Pass true if read was successful, else pass false
+    // If the value returned is true, clear the value
+    bool readStatusClearValue(bool success);
+
   public:
     static constexpr double defaultSensorPoll =3D 1.0;
     static constexpr unsigned int defaultSensorPollMs =3D

On Mon, Jan 27, 2025 at 3:43=E2=80=AFPM Mark Woodward <woodwardm@google.com=
> wrote:

> We are having an issue with psusensor in that when it is functioning with
> or without power, psusensor can read the status of the PSU. If the PSU is
> removed, the status of the PSU is never updated.
>
> It looks like in void PSUSensor::handleResponse() when there is a read
> error an error log string is output, restartRead () is called, but there =
is
> nothing done to the sensor data. This means that when a PSU is removed,
> aside from the log entry, there is no change to the sensor readings. It
> will just continue to report the last readings.
>
> Is a PoC, I added "updateValue(0 + sensorOffset);" in the error stanza, s=
o
> that when the PSU is removed, the values are cleared.
>
> Is this expected behavior?
>

--000000000000e3f31c062cc9abbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Here is a diff<div><br><div>diff --git a/src/PSUSensor.cpp=
 b/src/PSUSensor.cpp<br>index e454c74..4072e07 100644<br>--- a/src/PSUSenso=
r.cpp<br>+++ b/src/PSUSensor.cpp<br>@@ -133,6 +133,31 @@ void PSUSensor::de=
activate()<br>=C2=A0 =C2=A0 =C2=A0i2cDevice =3D nullptr;<br>=C2=A0 =C2=A0 =
=C2=A0path =3D &quot;&quot;;<br>=C2=A0}<br>+bool PSUSensor::readStatusClear=
Value(bool success)<br>+{<br>+ =C2=A0 =C2=A0bool result =3D false;<br>+ =C2=
=A0 =C2=A0if(success)<br>+ =C2=A0 =C2=A0{<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0l=
astClear =3D 0;<br>+ =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0else<br>+ =C2=A0 =C2=
=A0{<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int now =3D (unsigned int) ti=
me(0);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if(lastClear =3D=3D 0)<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0{<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lastCle=
ar =3D now;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0else<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if((now - lastClear) &gt; timeout_before_clear)<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0result =3D true;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0lastClear =3D 0;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0}<br>+ =
=C2=A0 =C2=A0return result;<br>+}<br>=C2=A0<br>=C2=A0void PSUSensor::setupR=
ead(void)<br>=C2=A0{<br>@@ -214,12 +239,19 @@ void PSUSensor::handleRespons=
e(const boost::system::error_code&amp; err,<br>=C2=A0 =C2=A0 =C2=A0{<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (readingStateGood())<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0{<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0std::cerr =
&lt;&lt; name &lt;&lt; &quot; read failed\n&quot;;<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0std::cerr &lt;&lt; name &lt;&lt; &quot; read failed=
:&quot; &lt;&lt; err &lt;&lt; &quot;\n&quot;;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if(readStatusClearValue(false))<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0{<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0std::cerr &lt;&lt; name &lt;&lt; &quot; clearing value&quot; &lt;&lt=
; &quot;\n&quot;;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0updateValue(0 + sensorOffset);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0}<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0restartRead();<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>=
=C2=A0 =C2=A0 =C2=A0}<br>=C2=A0<br>+ =C2=A0 =C2=A0readStatusClearValue(true=
);<br>+<br>=C2=A0 =C2=A0 =C2=A0// null terminate the string so we don&#39;t=
 walk off the end<br>=C2=A0 =C2=A0 =C2=A0std::array&lt;char, 128&gt;&amp; b=
ufferRef =3D *buffer;<br>=C2=A0 =C2=A0 =C2=A0bufferRef[bytesRead] =3D &#39;=
\0&#39;;<br>diff --git a/src/PSUSensor.hpp b/src/PSUSensor.hpp<br>index b49=
235f..a7ee95d 100644<br>--- a/src/PSUSensor.hpp<br>+++ b/src/PSUSensor.hpp<=
br>@@ -61,6 +61,16 @@ class PSUSensor : public Sensor, public std::enable_s=
hared_from_this&lt;PSUSensor&gt;<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0static co=
nstexpr size_t warnAfterErrorCount =3D 10;<br>=C2=A0<br>+ =C2=A0 =C2=A0// W=
ait timeout_before_clear (5 minutes)<br>+ =C2=A0 =C2=A0static constexpr uns=
igned int timeout_before_clear =3D 300; <br>+<br>+ =C2=A0 =C2=A0// Time of =
last clear<br>+ =C2=A0 =C2=A0unsigned int lastClear;<br>+<br>+ =C2=A0 =C2=
=A0// Pass true if read was successful, else pass false<br>+ =C2=A0 =C2=A0/=
/ If the value returned is true, clear the value<br>+ =C2=A0 =C2=A0bool rea=
dStatusClearValue(bool success);<br>+<br>=C2=A0 =C2=A0public:<br>=C2=A0 =C2=
=A0 =C2=A0static constexpr double defaultSensorPoll =3D 1.0;<br>=C2=A0 =C2=
=A0 =C2=A0static constexpr unsigned int defaultSensorPollMs =3D<br></div></=
div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"=
ltr" class=3D"gmail_attr">On Mon, Jan 27, 2025 at 3:43=E2=80=AFPM Mark Wood=
ward &lt;<a href=3D"mailto:woodwardm@google.com">woodwardm@google.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr">We are having an issue with psusensor in that when it is functio=
ning with or without power, psusensor can read the status of the PSU. If th=
e PSU is removed, the status of the PSU is never updated.=C2=A0<div><br></d=
iv><div>It looks like in=C2=A0void PSUSensor::handleResponse() when there i=
s a read error an error log string is output, restartRead () is called, but=
 there is nothing done to the sensor data. This means that when a PSU is re=
moved, aside from the log entry, there is no change to the sensor readings.=
 It will just continue to report the last readings.=C2=A0</div><div><br></d=
iv><div>Is a PoC, I added &quot;updateValue(0 + sensorOffset);&quot; in the=
 error stanza, so that when the PSU is removed, the values are cleared.</di=
v><div><br></div><div>Is this expected behavior?</div></div>
</blockquote></div>

--000000000000e3f31c062cc9abbb--
