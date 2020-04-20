Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CA31B12CE
	for <lists+openbmc@lfdr.de>; Mon, 20 Apr 2020 19:18:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495YLk6DfkzDqpp
	for <lists+openbmc@lfdr.de>; Tue, 21 Apr 2020 03:18:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=suichen6@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vRqJ1kQi; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495Y4S74dczDqmd
 for <openbmc@lists.ozlabs.org>; Tue, 21 Apr 2020 03:05:56 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id np9so123015pjb.4
 for <openbmc@lists.ozlabs.org>; Mon, 20 Apr 2020 10:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:date:from:subject:thread-topic:to
 :content-transfer-encoding;
 bh=t2uEeo4DomGPLwyGxWAJUnvV1aK32Pf7KHDfY5DVRco=;
 b=vRqJ1kQivfO0p9ygCiGDobTI5wHdVQgQr/ueXyNiwYE7xKwhPNt4IPZF/S3hOreqx5
 23WJf/lRY9CpQ5i8eCiD2Da3GMscCO/Om06DSXUxoWpp8sUM3XHs+XRI+MYu2QWN5VcQ
 3KhZICK/a+lTJkRcfdCU6OvswOWoXBcohghxuyhr/Yswea8QYijBr/PFO8G62PWHqwCC
 G1IOzLYR1swxuzk0TOzv18/NLVrRlBbpOxTlmBJ8ulTCMM+lCysqzvTaOPRiPxbiHVr3
 vyMpDiUxh09Chsv9X2VxBvpUg6xD0TbBcP8ZjwoPdEKE/W2NdvUba0yRjnONXFJwpMN3
 Lmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:date:from:subject
 :thread-topic:to:content-transfer-encoding;
 bh=t2uEeo4DomGPLwyGxWAJUnvV1aK32Pf7KHDfY5DVRco=;
 b=Cc4iyXxg+DqbQHLHskawdBsiaRJ5SYpLYuWFB2uNmMmX1PGkPBKFwxy9/RD1Blai1Y
 cjrc0lCBY1JLF0kMYySJOTO9D2yzFPtlVqxNsIfgbJi5koY4wqNZAEAb8u6yrAmj2OhP
 OgXiRo4rf4ANAF9aglTbUWiSvckFfyMK88e+WbVpiNQka4QafX62gysa8s+poY9lh+d6
 prVduvusyuF0itBf3f9WMsVi5WyrmM7SIPFetTqk1DedvG1dQOGPKk4ZlCcleCeBzd2s
 gkijXpAG5IT94XoZpPBVVXSMM5wDGyVyesZ8WZYiCL9rKDk8NVPE43+7mG4zYEQ5Ilkh
 YvXw==
X-Gm-Message-State: AGi0Pub7NRafH6ODpIqW2xZA7jVECF2IfuWPJOFLknVzg0h5dn20jXmO
 2bHjHqE9Ww/pMSCSKNdE6lgeNOUpr6k=
X-Google-Smtp-Source: APiQypItvJB4uSO2sTkNHN42sDWZBjhjzqd0lCJMGq+wEI12J57ET50L1bQnucF0jF2gjrWNWzUBSQ==
X-Received: by 2002:a17:90a:1da6:: with SMTP id
 v35mr485505pjv.44.1587402352556; 
 Mon, 20 Apr 2020 10:05:52 -0700 (PDT)
Received: from smtp.gmail.com ([2601:647:4c00:3a60:a0f6:a1ab:fa9a:2606])
 by smtp.gmail.com with ESMTPSA id l137sm30274pfd.107.2020.04.20.10.05.51
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Apr 2020 10:05:51 -0700 (PDT)
Message-ID: <5e9dd66f.1c69fb81.45fc6.0118@mx.google.com>
MIME-Version: 1.0
Date: Mon, 20 Apr 2020 10:05:48 -0700
From: Sui Chen <suichen6@gmail.com>
Subject: Re: Call for Gardening Tasks
Thread-Topic: Re: Call for Gardening Tasks
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"
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

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:DengXian;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DZH-CN link=3Dblue vlink=3D"#954F72"><div cla=
ss=3DWordSection1><p class=3DMsoNormal><span lang=3DEN-US>&gt; On Apr 11, 2=
020, at 8:15 AM, Andrew Geissler &lt;geissonator at gmail.com&gt; wrote:</s=
pan></p><p class=3DMsoNormal><span lang=3DEN-US>&gt; Systemd Visualization<=
/span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt; Another complicated =
area of OpenBMC is our systemd targets and services. Building on the upstre=
am tools to visualize our systemd targets and services would be useful to n=
ew people.</span></p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-=
size:12.0pt'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3D=
EN-US style=3D'font-size:12.0pt'>+1 to visualization, and I have a few thou=
ghts on this ---<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-=
US style=3D'font-size:12.0pt'>My lacking a mental model of how an OpenBMC s=
ystem works had been my pain point in the first few months working with Ope=
nBMC (I=E2=80=99m a bit new to this area), so after learning the minimal se=
t of survival skills I did something similar to what you mentioned =E2=80=
=93 visualizing the messages passed between different dbus peers (and conve=
niently, IPMI traffic, as IPMI-related dbus messages exposing all IPMI payl=
oad comprise most of the dbus traffic on that particular system I was worki=
ng on.)<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US style=
=3D'font-size:12.0pt'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><spa=
n lang=3DEN-US style=3D'font-size:12.0pt'>I think packet analysis tools suc=
h as Wireshark and graphics frame analysis tools such as RenderDoc, or syst=
em event-based Windows Performance tool like GPUView provide great examples=
 of what people might expect to achieve with a visualization tool: capture,=
 inspect and (sometimes) playback, across multiple layers in the software/h=
ardware stack. Many similar existing tools process sequences of events, and=
 in this case of BMCs, the events could be dbus messages. I found a prototy=
pe visualizer made at work greatly helpful in explaining to new team member=
s some basic concepts and the IPMI stack on the BMC.<o:p></o:p></span></p><=
p class=3DMsoNormal><span lang=3DEN-US style=3D'font-size:12.0pt'><o:p>&nbs=
p;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-si=
ze:12.0pt'>The IPMI stack is interesting because it=E2=80=99s one noticeabl=
e workload on the particular BMC system I had been working on; in my curren=
t limited understanding, having lots of I/O capability to connect to hundre=
ds of sensors is one of the many features that set apart a BMC chip and a s=
imilarly powerful smartphone chip, and the broad use of dbus is what sets a=
part OpenBMC and the desktop Linux distro I had been using. I heard optimiz=
ation is best done workload by workload, perhaps this rationale applies to =
visualization too?<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DE=
N-US style=3D'font-size:12.0pt'><o:p>&nbsp;</o:p></span></p><p class=3DMsoN=
ormal><span lang=3DEN-US style=3D'font-size:12.0pt'>I realize I was mostly =
talking about visualizing the run-time state of the system rather than buil=
d-time, but we could visualize the run-time aspect of systemd units too sin=
ce I have seen many times a dbus message eventually triggering a systemd ta=
rget to acutate the system, so it would be good to consider both dbus and s=
ystemd (and maybe other parts of the system?) to have a more holistic view =
of the BMC=E2=80=99s operations.<o:p></o:p></span></p><p class=3DMsoNormal>=
<span lang=3DEN-US style=3D'font-size:12.0pt'><o:p>&nbsp;</o:p></span></p><=
p class=3DMsoNormal><span lang=3DEN-US style=3D'font-size:12.0pt'>Thanks<o:=
p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-si=
ze:12.0pt'>Sui<o:p></o:p></span></p></div></body></html>=

