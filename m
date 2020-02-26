Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CB116F4FA
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 02:28:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RyqK2ZwjzDqFM
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 12:28:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22c;
 helo=mail-lj1-x22c.google.com; envelope-from=krellan@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=EJxcyIqP; dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Rypd13WlzDqBc
 for <openbmc@lists.ozlabs.org>; Wed, 26 Feb 2020 12:27:29 +1100 (AEDT)
Received: by mail-lj1-x22c.google.com with SMTP id x7so1084427ljc.1
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 17:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=EHXe/HBbw1W8vvU74PiW6pq8TQ//+OjN1hBeNLQ5ISw=;
 b=EJxcyIqP+TYmcIIoudVTSdL/9eAFynZjN0cxqCJm4ClpARLgRLPjlj/Y0WnQCDLrTu
 3C8YHKbx9M5wDUWWQ89s2/YcEe7dcVX3/vyupoUN1FuKRk7dOllSr3pC/02YvgCGj5M9
 wX5PxKbbD1r0Aor7j0wMClgwHMQiPY5U+e7mx5Jux/edXX4BwP6wgV3/DRDpsXDMS+j3
 kCzE5p/piNo6oXjUKalioErXkvNq5uaR2JUwCKbP5AXqy0ipKsOz1NQo0kLW7BJffG7v
 T0Tk/e4b/ehVW73bJ9xcD/cqRknuGCa06bZqgehIS7XyIp7rURuqiuStrL0lodInyllO
 xelg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=EHXe/HBbw1W8vvU74PiW6pq8TQ//+OjN1hBeNLQ5ISw=;
 b=DDex7kPLRfF34VW35uY5QXb6LzyWs72gBUuKARGJsZ/+kIv2p1RqRYxc7vk4ciCqJk
 Yoi8f4MTNAxrUpzmWbHBxh55ur70JGwKn2rkw8xS6Fzbnh1w6RfMaRO3mzS8rOPfYJAe
 d48zuuUN4UcrB4kH40drD14S33N6Um+PyLr2F4XBSN/ERXkP18dLmWwE3Y5Dw1O3SaS8
 C3g6I19bpkO7M8YiWobyiTx462/qVgBBVv0hGEukx4fKCRD0qQRJr5bKPgYWVd9oN+bE
 AhwY/I5M0JavQ2blyyfwdNnK/YbCTHi/Pp8oVRPQKHPfcRzPbRQUySFoWNCvt9T/Xs0z
 4+kw==
X-Gm-Message-State: APjAAAUg2KE6AqAFmW28BXuj0NogyenebUjZ+V3taQSVosvvrfar/fMI
 3uNA2sHbGNOmBz9A5AFfJn3fEnivITb4KZveS5JM9FsZHgc=
X-Google-Smtp-Source: APXvYqy5IS4AUvFhcE25BZF11Ho/61GmcrpTocQvm8ED+E6tUNqDwpjlbMxhmLzSclH9VWg2ujwo5mEoBvvmVHEbtYQ=
X-Received: by 2002:a05:651c:1bb:: with SMTP id
 c27mr1129519ljn.277.1582680443030; 
 Tue, 25 Feb 2020 17:27:23 -0800 (PST)
MIME-Version: 1.0
From: Josh Lehan <krellan@google.com>
Date: Tue, 25 Feb 2020 17:26:57 -0800
Message-ID: <CANPkJS8pfmJF9fTk3GQE45g8xQfu_NaLyuhWK=_+=o3B6Hsh_A@mail.gmail.com>
Subject: dbus-sensors updateValue update hysteresis logic question
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000099cfb4059f708148"
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

--00000000000099cfb4059f708148
Content-Type: text/plain; charset="UTF-8"

Hi there! Question about updateValue(), in sensor.hpp file, in dbus-sensors
package.

In updateValue(), it always calls set_property() to update the stored value
to the new passed-in value, sending the new value on D-Bus. However, it
then tests the hysteresis variable, to avoid a very small change. It only
updates the stored value if the change is significant enough. This logic in
updateValue() seems strange to me. Wouldn't you want to either do both of
these operations at once, or none of them at all?

If D-Bus is updated but the stored value is not also updated, it would
cause them to get out of sync, over time. Think of a slowly changing value,
just under the hysteresis threshold, but with each new reading, over time,
it adds up to a substantial change. This would cause the D-Bus value to be
updated but the stored value to not be updated. Then, if the sensor were to
return to the value of the stored value, it would falsely be seen as not an
update.

Also, in the PSUSensor::handleResponse() function, it does a test for
equality before calling updateValue(). Shouldn't this test be done by
updateValue() itself? Interestingly, PSUSensor doesn't check for hysteresis
at all, so these are two different tests. I'm considering refactoring it,
to have updateValue() make the decision, so the decision is all made in one
place.

What's more, PSUSensor uses floating-point equality when testing for
equality. This is considered harmful, and in practice means that most
readings aren't considered equal, even when they effectively are, so
there's a lot of excess update traffic on the D-Bus, defeating most of the
hysteresis logic above.

And, finally, the hysteresis variable is defined as ((max-min)*0.01) which
means that a value must be changed by 1/100 of full scale, in order to be
considered a change. This seems to be throwing away some useful sensor
resolution here. IPMI is "accurate" down to 1/255 of full scale, so it
would make sense to at least be as precise as that allows. It might be more
useful to lower the hysteresis threshold to 1/1000 of full scale, which
would give plenty of headroom.

Any thoughts on these points? Thanks for reading this.
Josh

Josh Lehan | Software Engineer | krellan@google.com | +1 650-733-8941

--00000000000099cfb4059f708148
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi there! Question about updateValue(), in sensor.hpp=
 file, in dbus-sensors package.</div><div><br></div><div>In updateValue(), =
it always calls set_property() to update the stored value to the new passed=
-in value, sending the new value on D-Bus. However, it then tests the hyste=
resis variable, to avoid a very small change. It only updates the stored va=
lue if the change is significant enough. This logic in updateValue() seems =
strange to me. Wouldn&#39;t you want to either do both of these operations =
at once, or none of them at all?</div><div><br></div><div>If D-Bus is updat=
ed but the stored value is not also updated, it would cause them to get out=
 of sync, over time. Think of a slowly changing value, just under the hyste=
resis threshold, but with each new reading, over time, it adds up to a subs=
tantial change. This would cause the D-Bus value to be updated but the stor=
ed value to not be updated. Then, if the sensor were to return to the value=
 of the stored value, it would falsely be seen as not an update.</div><div>=
<br></div><div>Also, in the PSUSensor::handleResponse() function, it does a=
 test for equality before calling updateValue(). Shouldn&#39;t this test be=
 done by updateValue() itself? Interestingly, PSUSensor doesn&#39;t check f=
or hysteresis at all, so these are two different tests. I&#39;m considering=
 refactoring it, to have updateValue() make the decision, so the decision i=
s all made in one place.</div><div><br></div><div>What&#39;s more, PSUSenso=
r uses floating-point equality when testing for equality. This is considere=
d harmful, and in practice means that most readings aren&#39;t considered e=
qual, even when they effectively are, so there&#39;s a lot of excess update=
 traffic on the D-Bus, defeating most of the hysteresis logic above.</div><=
div><br></div><div>And, finally, the hysteresis variable is defined as ((ma=
x-min)*0.01) which means that a value must be changed by 1/100 of full scal=
e, in order to be considered a change. This seems to be throwing away some =
useful sensor resolution here. IPMI is &quot;accurate&quot; down to 1/255 o=
f full scale, so it would make sense to at least be as precise as that allo=
ws. It might be more useful to lower the hysteresis threshold to 1/1000 of =
full scale, which would give plenty of headroom.</div><div><br></div><div>A=
ny thoughts on these points? Thanks for reading this.</div><div>Josh</div><=
div><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmai=
l=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div style=3D"=
line-height:1.5em;padding-top:10px;margin-top:10px;color:rgb(85,85,85);font=
-family:sans-serif"><span style=3D"border-width:2px 0px 0px;border-style:so=
lid;border-color:rgb(213,15,37);padding-top:2px;margin-top:2px">Josh Lehan=
=C2=A0|</span><span style=3D"border-width:2px 0px 0px;border-style:solid;bo=
rder-color:rgb(51,105,232);padding-top:2px;margin-top:2px">=C2=A0Software E=
ngineer=C2=A0|</span><span style=3D"border-width:2px 0px 0px;border-style:s=
olid;border-color:rgb(0,153,57);padding-top:2px;margin-top:2px">=C2=A0<a hr=
ef=3D"mailto:krellan@google.com" target=3D"_blank">krellan@google.com</a>=
=C2=A0|</span><span style=3D"border-width:2px 0px 0px;border-style:solid;bo=
rder-color:rgb(238,178,17);padding-top:2px;margin-top:2px">=C2=A0+1 650-733=
-8941</span></div><br></div></div></div></div></div></div>

--00000000000099cfb4059f708148--
