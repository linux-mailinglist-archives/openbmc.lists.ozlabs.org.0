Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A14B17CA01
	for <lists+openbmc@lfdr.de>; Sat,  7 Mar 2020 01:59:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Z5j321P1zDrSB
	for <lists+openbmc@lfdr.de>; Sat,  7 Mar 2020 11:59:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.194;
 helo=mail-lj1-f194.google.com; envelope-from=obmc.developers@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hObD+EJa; dkim-atps=neutral
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Z5hM44WyzDsXy
 for <openbmc@lists.ozlabs.org>; Sat,  7 Mar 2020 11:58:26 +1100 (AEDT)
Received: by mail-lj1-f194.google.com with SMTP id f10so4086835ljn.6
 for <openbmc@lists.ozlabs.org>; Fri, 06 Mar 2020 16:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=rU5IBfQ8CpcgWBJsYc8mVXvJSEK/Fl6zXyk9Mho9djg=;
 b=hObD+EJaUxakYL4qdq06/+uSQrnQSV1l2zkzxIv+I4vvuIxbm2wlbK/vhSsmCwg2MR
 nH5Ly2lPgzDpqWiHF6297yEPFClezcJAHxsPPvfBLkGTtlg3GEPDVA1wOAwvTuwjB9n0
 Tw/G905XvBL2YoSPfaqgSg3sOrirPvzpLINV5ocNgQ49zJjfrYRMJCDUG3GcaiReQsUu
 BftQgxcHblSxTMHsK1DDZZy0gO++AHPWKEh8aPJhR6bURxWY9EjeESGnhW0aYhMRdF3R
 sk4AwI5+lnTkO6qbIBTKyGSwWrxBQ+bjGnw+hYusrfst/Vw81JIC66UN2Pq5cP9PaXJW
 iNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=rU5IBfQ8CpcgWBJsYc8mVXvJSEK/Fl6zXyk9Mho9djg=;
 b=A+oHl3tluird7CLv2N8mU1bGWaPHtvQzVuVF6RE+RgVhn0DzbPWbnSk7/6RhaWEKks
 JbpYBlk38yPy3rhQ5PWg1wU2aBho8PsU4TBdexxHY6lHGTAflRwPL4VgSAsWVx5gR5jP
 QBaY/hptnhxLztwzGQGmPsO4JAxIbUEj6g0woCgcupfxEzXnRY/ldXb+MziqnvqcHjzT
 RXsr7nuQXhoh2dtpob6h83NE9pYl2FiOkSGDepRcHnNwhtPvtmPa86L3pL7qQ7HN5fAw
 fQnF7fABiOhG8pHZ9/EjFP3w+9FnhVfznhjqNpyOdNJs15ObUbZbtEXML/1Lw88uC4Lr
 HKVg==
X-Gm-Message-State: ANhLgQ0ZnJTcuTcRyMeQe5OO1FZuhIc0bN7hoSAlOJ4acOVtynSGPnn7
 BUhOTr8xbWWbwQQiKrSjMhbG6a5nFs4/DoclTCJWrJXT/Yk=
X-Google-Smtp-Source: ADFU+vuO8WI8nRzhPybU55w+3xAxuamv0MufLpjTaF3gE3Ixq7O2Y7FxKuSXhqadvGUCThzbm2KFZwxQ9C6OdCShPok=
X-Received: by 2002:a2e:920e:: with SMTP id k14mr3532969ljg.73.1583542641932; 
 Fri, 06 Mar 2020 16:57:21 -0800 (PST)
MIME-Version: 1.0
From: Anony Mous <obmc.developers@gmail.com>
Date: Fri, 6 Mar 2020 16:54:46 -0800
Message-ID: <CABbLDjOsmeBTWb94DkeJHfUMNHzXEairkP+_rC4g4TRgZUn_7g@mail.gmail.com>
Subject: IPMI Raw Commands
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000a8bc8f05a03940a0"
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

--000000000000a8bc8f05a03940a0
Content-Type: text/plain; charset="UTF-8"

To whom it may concern,

1. Does openbmc ipmitool support any of the ipmi raw commands? Most of them
(such as the one below) returns "invalid command".
ipmitool raw <netfn> <command>

Where:
netfn = storage = 0x0a
command = enter sdr respository update mode = 0x2a

The above command was executed on the BMC and the following error returned:

"Unable to send RAW command (channel=0x0 netfn=0xa lun=0x0 cmd=0x2a
rsp=0xc1): Invalid command"

2.  Can the ipmi raw commands be executed on the BMC itself or does it need
to be executed from an external source (such as a processor connected to
the BMC)?

3. Do any kind of privilege settings need to be modified in order to
execute any ipmi raw commands?

--000000000000a8bc8f05a03940a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>To whom it may concern,</div><div><br></div>1. Does o=
penbmc ipmitool support any of the ipmi raw commands? Most of them (such as=
 the one below) returns &quot;invalid command&quot;. <br>ipmitool raw &lt;n=
etfn&gt; &lt;command&gt;<br><br>Where: <br>	netfn =3D storage =3D 0x0a<br>	=
command =3D enter sdr respository update mode =3D 0x2a<br>	<br>The above co=
mmand was executed on the BMC and the following error returned:<br><br>&quo=
t;Unable to send RAW command (channel=3D0x0 netfn=3D0xa lun=3D0x0 cmd=3D0x2=
a rsp=3D0xc1): Invalid command&quot;<br><div><br></div><div>2.=C2=A0

Can the ipmi raw commands be executed on the BMC itself or does it need to =
be executed from an external source (such as a processor connected to the B=
MC)?=C2=A0</div><div><br></div><div>3. Do any kind of privilege settings ne=
ed to be modified in order to execute any ipmi raw commands?</div></div>

--000000000000a8bc8f05a03940a0--
