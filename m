Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EE916F28D
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 23:23:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Rtkg2WcSzDqTF
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 09:23:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::230;
 helo=mail-lj1-x230.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=aD9lSsfP; dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Rtjs2YfGzDqSr
 for <openbmc@lists.ozlabs.org>; Wed, 26 Feb 2020 09:23:12 +1100 (AEDT)
Received: by mail-lj1-x230.google.com with SMTP id q8so694432ljb.2
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 14:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Tba1Vsh6D2IMr/J6NV2FxJUJDx8iwaRTvSmydRxQrXc=;
 b=aD9lSsfPSv+KnV4e1gdftwZsC4THfCjd3z8o8DOV2zmJn4RIxgeKHJZq/MLOweCWFO
 cgy7yC5jkKcpC1derturgkWLSexuBfhFmBup7IJ4A90F5chG/WMdQ4vPIgGmrkVp2JRg
 /cHmd6Uxx9+Sk5TgXJeSpmkMqBb59vO0MGobKSJKsiB5+b1vBbwoLouW7KzH3wtEj4bA
 n+O505g4ISweuDy18XWYn6oRCV9Ep16pa5GixIcGC/ZmugfXwIY90CIw6bOda75GdLwm
 cmT1sGBVQtcNABljX+KVWbKTaVX+3jxR3x1AhMtum3RvbrY0V+OeGyXfQVJ3Yl4F5aDR
 BR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Tba1Vsh6D2IMr/J6NV2FxJUJDx8iwaRTvSmydRxQrXc=;
 b=EGxBJ4GcR92yPp3GrQeibDtJnVB2plPzikks84M+0B3gmd0WCUz9PTy1sERphx5ond
 YO/ClKJ7QXJfdQ8o/TVXFhPJA1uvfBdcbJ373m3xJf/VBDlk1M0Gao00HVXOuMtaYLmG
 pwj6n0P7kkm/9bWJ3VefAoPixe0H4X6+VYPNJO/nhX4E1DmwC/YdwKb/1LH1YIIdrgA2
 kAOwwpdX27UZUZ9p/j2b43tcpBqZS2AnpwbIxN4OoG3vvQuZeSHap7z6tumyWFKOqGke
 +UiFJ8RPtvXjVZQ9KDYLBtgsEPD5ustTadma11KCEpBePRMRlPKzM1tZid13zFGPqnMi
 /yhQ==
X-Gm-Message-State: ANhLgQ06tcfMFripTnT9Nou+pbZ0pi3gWxpnX0QYpi8Zx7eKFJZV/eAv
 0TTHG0/0IXLOuON56FARtkmvXcAroVsroqofm7qmsF1o
X-Google-Smtp-Source: ADFU+vvCFlcToE/4/LM3OPCo2R96nMDjxaMNsaAoURoHLezNht8ctXXxSK/KTnC4w8zdU6EbGBVVeKZEYXOK1Ri3JQA=
X-Received: by 2002:a2e:90c6:: with SMTP id o6mr707216ljg.129.1582669387856;
 Tue, 25 Feb 2020 14:23:07 -0800 (PST)
MIME-Version: 1.0
From: Richard Hanley <rhanley@google.com>
Date: Tue, 25 Feb 2020 14:22:56 -0800
Message-ID: <CAH1kD+a-3tb-=Xi17w=qrW3xLTJCk9JHF1b+PA=hvkekjSWt-w@mail.gmail.com>
Subject: Adding a detailed physical model to bmcweb
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000a9523e059f6dee76"
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

--000000000000a9523e059f6dee76
Content-Type: text/plain; charset="UTF-8"

One of the requirements we have for our data center management software is
that we need to be able to map resources (e.g. actions, telemetry, and
assemblies) directly to the physical component that it originated from as
well as how those components are physically connected.

Historically this mapping was done through a custom protocol on the host,
and we would like to move this to a Redfish service on the BMC. Another
engineer spoke with DMTF, and the most Redfishy way to represent this would
be by adding links in the assemblies. Some examples of possible
relationships are:

*/Systems/1/Memory/1/Assembly ------> /Chassis/Mobo/Sensors/MemSensor*
*/Chassis/Mobo/PCIeDevices/Storage/Assembly ---------->
/Systems/1/Storage/BootVolume*
*/Chassis/Mobo/PCIeDevices/ExpansionTray/Assembly --------->
/Chassis/ExpansionTray/Assemby*

That last example is actually represented in the current Redfish spec, but
it helps explain the idea I'm getting at.  The hope is that by starting at
the service entry point we can get a physical model of the component tree
by traversing hyperlinks. From that a client could relate any Redfish
resource to its physical component.

Let's just say for the moment that we get a service that collects this
information, I've been trying to figure out a way to sustainably add it
into bmcweb.  Presumably this would be a large amount of OEM material that
OpenBMC wouldn't want to support upstream.

I don't think making patches in bitbake or subclassing the individual nodes
will be sustainable in the long run.  At a minimum a way to chain
co-routines would allow for other code to "attach" to the response handlers.

So I guess there are a couple of questions here.  Does the community have
any plans/desire to support an extension mechanism in bmcweb? If so, should
we be thinking of in-process code extensions or inter-process dynamic
extensions?

For the record, this requirement does not have an imminent deadline, so I
am happy to design around the best long term solution as opposed to a short
term hack.  I just wanted to get a plan here before things become imminent.

Thanks,
Richard

--000000000000a9523e059f6dee76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">One of the requirements we have for our data center manage=
ment software is that we need to be able to map resources (e.g. actions, te=
lemetry, and assemblies) directly to the physical component that it origina=
ted from as well as how those components are physically connected.<div><br>=
</div><div>Historically this mapping was done through a custom protocol on =
the host, and we would like to move this to a Redfish service on the BMC. A=
nother engineer spoke with DMTF, and the most Redfishy way to represent thi=
s would be by adding links in the assemblies. Some examples of possible rel=
ationships are:</div><div><br></div><div><i>/Systems/1/Memory/1/Assembly --=
----&gt; /Chassis/Mobo/Sensors/MemSensor</i></div><div><i>/Chassis/Mobo/PCI=
eDevices/Storage/Assembly ----------&gt; /Systems/1/Storage/BootVolume</i><=
/div><div><i>/Chassis/Mobo/PCIeDevices/ExpansionTray/Assembly ---------&gt;=
 /Chassis/ExpansionTray/Assemby</i></div><div><i><br></i></div><div>That la=
st example is actually represented in the current Redfish spec, but it help=
s explain the idea I&#39;m getting at.=C2=A0 The hope is that by starting a=
t the service entry point we can get a physical model of the component tree=
 by traversing hyperlinks. From that a client could relate any Redfish reso=
urce to its physical component.</div><div><br></div><div>Let&#39;s just say=
 for the moment that we get a service that collects this information, I&#39=
;ve been trying to figure out a way to sustainably add it into bmcweb.=C2=
=A0 Presumably this would be a large amount of OEM material that OpenBMC wo=
uldn&#39;t want to support upstream.</div><div><br></div><div>I don&#39;t t=
hink making patches in bitbake or subclassing the individual nodes will be =
sustainable in the long run.=C2=A0 At a minimum a way to chain co-routines=
=C2=A0would allow for other code to &quot;attach&quot; to the response hand=
lers.</div><div><br></div><div>So I guess there are a couple of questions h=
ere.=C2=A0 Does the community have any plans/desire to support an extension=
 mechanism in bmcweb? If so, should we be thinking of in-process code exten=
sions or inter-process dynamic extensions?=C2=A0=C2=A0</div><div><br></div>=
<div>For the record, this requirement does not have an imminent deadline, s=
o I am happy to design around the best long term solution as opposed to a s=
hort term hack.=C2=A0 I just wanted to get a=C2=A0plan here before things b=
ecome imminent.</div><div><br></div><div>Thanks,</div><div>Richard</div></d=
iv>

--000000000000a9523e059f6dee76--
