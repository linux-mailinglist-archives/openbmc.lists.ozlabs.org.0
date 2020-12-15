Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5812DA69E
	for <lists+openbmc@lfdr.de>; Tue, 15 Dec 2020 04:03:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cw34P2xlVzDqBt
	for <lists+openbmc@lfdr.de>; Tue, 15 Dec 2020 14:03:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=raviteja28031990@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=icqfSP9I; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cw31R2xmWzDqGJ
 for <openbmc@lists.ozlabs.org>; Tue, 15 Dec 2020 14:01:11 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id l23so8075923pjg.1
 for <openbmc@lists.ozlabs.org>; Mon, 14 Dec 2020 19:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LbqAL/UfiKM/dyCxEm43yVUR48cQdxXiAJhnonIvET4=;
 b=icqfSP9IIw3QO/cvEgpYUJeimQ33sGwGcvG/ijTWPLAF1lJ1OM5DP020l8oQkRuIPf
 TV0Ysw+wNuIur2J2hrnWFCkxXP+mIuiiapP4HP3dZ/fbi4q0NI1gRfR6BYKUpLeBLPCF
 WHYpBz2AWw9ifE8jONSIHRwV1ZWyfEzmtA0/xEurC8g5fDMoo0rN1JFQHpcp83I5DCOX
 6/pyIQ2ixAmn+Uq/0ct/iIzPmmtP0ST6CTjMneChdd40nJszyPFBVBMxI/V1bQr9mExW
 SUu9L3sxgBTdc7FRz/G83ovdF2G00fnM3Tx6rNLyfwh+lPlHl48Bdc6Ghse1xgfoy6M6
 Touw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LbqAL/UfiKM/dyCxEm43yVUR48cQdxXiAJhnonIvET4=;
 b=b7Vf0h5XhMBYGYhpWh/2QP8Y8N/JcPr2L2AhhpCbPXm5ezQ4/PBw3nbZvZ4nFo7hXp
 joQdMoM/1O0++YlyACJyBUQFumqIZZSPNXd5QB7zjNVJc5HtpzGcIwVjeOUBvL7Jarao
 iqE15zKe/fpWoS0hPYNs/GFJrWGlZgnqJNsvfVoQ1v9BhJfX6LKc2IT4ZOtSqCJhtvST
 e521X5V9NSRj2Iow4u4sS8OWspwdN5Mxik8uXrhWA8iqts1QAHmhAg848JNkwG225DPM
 czUrCvHclE5jiA0+5gjC19DBjPbVdBe82ABMRp4s8VQQvomIdUuMVRprDHLVW31qk1rv
 GFWQ==
X-Gm-Message-State: AOAM530ada8NmcYq9so4Rl0WjHzL7sI//01w7CudBth2p/Qz8RecADJe
 ACopwGLFTxylZrBkdzzKYz2DW71bJJWsHkE/txQ=
X-Google-Smtp-Source: ABdhPJx8Tyisgzz0678Kybr7iK5C5qZgdkhJ6XIeRxQWFdJeqO50imlGfihEIyzcaIOkPrUOV7/hgwzzGM785oA2tdE=
X-Received: by 2002:a17:902:be02:b029:da:c6c9:c9db with SMTP id
 r2-20020a170902be02b02900dac6c9c9dbmr25174353pls.69.1608001267810; Mon, 14
 Dec 2020 19:01:07 -0800 (PST)
MIME-Version: 1.0
References: <757e2adb-4f63-30f2-3f53-0f25bd990a72@linux.vnet.ibm.com>
In-Reply-To: <757e2adb-4f63-30f2-3f53-0f25bd990a72@linux.vnet.ibm.com>
From: raviteja bailapudi <raviteja28031990@gmail.com>
Date: Tue, 15 Dec 2020 08:30:56 +0530
Message-ID: <CAM4DKZkFTO0EqUg-1Kd_Obag=u6DH6GRAcq3hfEHnMcHWYrovg@mail.gmail.com>
Subject: Re: Depreciate PATCH support for HostName at NetworkProtocol
To: Gunnar Mills <gmills@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000005dc49a05b677f801"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>, rbailapu@in.ibm.com,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>, johnathanx.mantey@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000005dc49a05b677f801
Content-Type: text/plain; charset="UTF-8"

Hi Gunnar

yes. there was an issue opened for the same
https://github.com/openbmc/bmcweb/issues/44
I remember adding  patch support to fix this issue.. I think we had
discussed about hostname property in
ethernet vs network protocol , it has been long back don't remember exactly.

Thanks
Raviteja

On Mon, Dec 14, 2020 at 11:57 PM Gunnar Mills <gmills@linux.vnet.ibm.com>
wrote:

> Hi Ravi,
>
> I believe you implemented PATCH support for HostName at
> /redfish/v1/Managers/bmc/NetworkProtocol
>
>
> https://github.com/openbmc/bmcweb/commit/501be32b4230dfa2730467985c6306f15fe7af61
>
> Looking for some background around the commit. Do you know why this was
> added? Do you know if any clients are PATCHing HostName here?
>
> HostName at /redfish/v1/Managers/bmc/NetworkProtocol is a read-only
> property and PATCH support here violates the Redfish spec.
>
> HostName at /redfish/v1/Managers/bmc/EthernetInterfaces/<str> is a
> read-write property and can be PATCHed. This is what webui-vue uses.
>
> Still discussion on how we would depreciate this PATCH support on
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/38475
>
> Does anyone know of a client PATCHing HostName at the NetworkProtocol
> resource?
>
> https://redfish.dmtf.org/schemas/v1/ManagerNetworkProtocol.v1_6_1.json
> https://redfish.dmtf.org/schemas/v1/EthernetInterface.v1_6_2.json
>
>
> Thanks,
> Gunnar
>

--0000000000005dc49a05b677f801
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Gunnar<br><br>yes. there was an issue =
opened for the same=C2=A0<a href=3D"https://github.com/openbmc/bmcweb/issue=
s/44">https://github.com/openbmc/bmcweb/issues/44</a><br>I remember adding=
=C2=A0 patch support to fix this issue.. I think we had discussed about hos=
tname property in=C2=A0<br>ethernet vs network protocol , it has been long =
back don&#39;t remember exactly.<br></div><br>Thanks<br>Raviteja<br><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 1=
4, 2020 at 11:57 PM Gunnar Mills &lt;<a href=3D"mailto:gmills@linux.vnet.ib=
m.com">gmills@linux.vnet.ibm.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Ravi,<br>
<br>
I believe you implemented PATCH support for HostName at <br>
/redfish/v1/Managers/bmc/NetworkProtocol<br>
<br>
<a href=3D"https://github.com/openbmc/bmcweb/commit/501be32b4230dfa27304679=
85c6306f15fe7af61" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
openbmc/bmcweb/commit/501be32b4230dfa2730467985c6306f15fe7af61</a><br>
<br>
Looking for some background around the commit. Do you know why this was <br=
>
added? Do you know if any clients are PATCHing HostName here?<br>
<br>
HostName at /redfish/v1/Managers/bmc/NetworkProtocol is a read-only <br>
property and PATCH support here violates the Redfish spec.<br>
<br>
HostName at /redfish/v1/Managers/bmc/EthernetInterfaces/&lt;str&gt; is a <b=
r>
read-write property and can be PATCHed. This is what webui-vue uses.<br>
<br>
Still discussion on how we would depreciate this PATCH support on<br>
<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/38475" rel=
=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-project.xyz/c/open=
bmc/bmcweb/+/38475</a><br>
<br>
Does anyone know of a client PATCHing HostName at the NetworkProtocol <br>
resource?<br>
<br>
<a href=3D"https://redfish.dmtf.org/schemas/v1/ManagerNetworkProtocol.v1_6_=
1.json" rel=3D"noreferrer" target=3D"_blank">https://redfish.dmtf.org/schem=
as/v1/ManagerNetworkProtocol.v1_6_1.json</a><br>
<a href=3D"https://redfish.dmtf.org/schemas/v1/EthernetInterface.v1_6_2.jso=
n" rel=3D"noreferrer" target=3D"_blank">https://redfish.dmtf.org/schemas/v1=
/EthernetInterface.v1_6_2.json</a><br>
<br>
<br>
Thanks,<br>
Gunnar<br>
</blockquote></div></div>

--0000000000005dc49a05b677f801--
