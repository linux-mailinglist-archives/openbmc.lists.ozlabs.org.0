Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAF65C061
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2019 17:36:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cs0r6VYrzDqY5
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 01:36:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Av/QyL78"; 
 dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45crs94LYFzDqXW
 for <openbmc@lists.ozlabs.org>; Tue,  2 Jul 2019 01:29:49 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id f195so103769ybg.9
 for <openbmc@lists.ozlabs.org>; Mon, 01 Jul 2019 08:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=pMMLFTLeL7J+VIIfgTSyorb2QdN3IRAtFQWPPx8oBTI=;
 b=Av/QyL78gAKec+tHVb8BP6uFLeAhJX7p6/Ei7ocIUfo7tJjld6BIBOub4od5TsyH54
 DU7bFpvQoPdP85varD8M6ydbp08xdl854Fa5OVJI4bg3Bi2fSbaNZyDddZWmwRW8A0pH
 xlwgbtWDSJTpGnMCBa2PozQIcY58Jt11yQgnTZz8M32nBwBS0HqUkODDh0M+gzSMvHOC
 ii7ifepLqox1SrwTZ5/YlK709ZqSGdiioBMduuJIffH5rgOEUWBOZh432rffRE+61fF+
 oXopZ6b1SlK5X3QDt6SsbVQxIeve566AQ3tsdGV0udXUypRiU5a+qVZQxky3EXgAFJ6/
 BKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=pMMLFTLeL7J+VIIfgTSyorb2QdN3IRAtFQWPPx8oBTI=;
 b=If8oCaCbPojRDhjjGKhcX2HdA/wteHkv13xa4NHVScSNhWfclZ8BF+bpLVblVPPdtr
 UyAc0al75RuECIr8tYQNmH8XS5Mba434kAqgB7bHz3RwoYJu+ruLyyGW9S0qnZv4T42i
 vCPNDvmo5HvrxRIkdJGfTblLB7n1tCfo8FoLYZgeSGEm3J35X3bDGiKQ+j5hCg75wQoQ
 jJ8vtEc6oKyOtIu/q/WCUhArDoeHBnJWnsptYUaBjUuSkIcxBeKoYN4NsEUoYFDLO+W+
 jl1S1yS/GlSBfZjAgcb3SPumvD7eke3gn+8cnfPzbePM2u8v7FHJBzaKkWICjQdS8m5J
 J83w==
X-Gm-Message-State: APjAAAUpDf2iA1TEyBMEHJMVy58YQ1b8WCo/lszCLbOBagu110C7tQLw
 5Up2p9dwlYWGALkVgC5K4ThsXK7equU19xIw93eDToPC
X-Google-Smtp-Source: APXvYqw0meBFmb7zVEKflzItQpqI6Sr+pffXwmZqfQWaKe3r2SIsjwfZqXb45CKSnULkelhIEIA6fhAAzuY+CFEOC0U=
X-Received: by 2002:a5b:986:: with SMTP id c6mr15925910ybq.130.1561994985818; 
 Mon, 01 Jul 2019 08:29:45 -0700 (PDT)
MIME-Version: 1.0
From: Jandra A <jandraara@gmail.com>
Date: Mon, 1 Jul 2019 10:29:34 -0500
Message-ID: <CAMTupoTEL_65WPD23kqaQKJJ=DVM9nv2SYum+qdkR8TkDQK5zg@mail.gmail.com>
Subject: GUI Design mockups - TPM
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000454d68058ca04ca6"
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

--000000000000454d68058ca04ca6
Content-Type: text/plain; charset="UTF-8"

Hello all,

Our design team has been working to create GUI design mockups for TPM.

We are gathering feedback from users and working with a couple subject
matter experts to figure out if the 'sensors' portion of it, relating to
whether or not it is functional, should be included in the GUI since the
majority of time is spent at runtime, and not having an updated state in
runtime means there is a huge gap in coverage. Either way when a TPM fails,
an event could be created in the event logs and a user would find out there.

As for the required policy, we are proposing placing this in the Server
Power Operations given that the required policy will really only matter and
take effect during reboot/power on. Additionally, this is where users would
be configuring 'how' the boot occurs. Here are the mockups for
enabling/disabling the required policy.

https://ibm.invisionapp.com/share/8ENYRVXAPFD#/319150964_3-7-1A_Boot_Options_Empty
(Navigate by clicking on any flashing blue rectangles or using the keyboard
arrows).

Since the interaction is a simple on/off, we added the component in the
'on' state to the boot options flow. To navigate the prototype, click on
flashing blue rectangles or use the right and left keyboard arrows.

Looking forward to your feedback,
GUI Design team

--000000000000454d68058ca04ca6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello all,=C2=A0<br><br>Our design team has been working t=
o create GUI design mockups for TPM.<br><br>We are gathering feedback from =
users and working with a couple subject matter experts to figure out if the=
 &#39;sensors&#39; portion of it, relating to whether or not it is function=
al, should be included in the GUI since the majority of time is spent at ru=
ntime, and not having an updated state in runtime means there is a huge gap=
 in coverage. Either way when a TPM fails, an event could be created in the=
 event logs and a user would find out there.<br><br>As for the required pol=
icy, we are proposing placing this in the Server Power Operations given tha=
t the required policy will really only matter and take effect during reboot=
/power on. Additionally, this is where users would be configuring &#39;how&=
#39; the boot occurs. Here are the mockups for enabling/disabling the requi=
red policy.<br><br><a href=3D"https://ibm.invisionapp.com/share/8ENYRVXAPFD=
#/319150964_3-7-1A_Boot_Options_Empty">https://ibm.invisionapp.com/share/8E=
NYRVXAPFD#/319150964_3-7-1A_Boot_Options_Empty</a> (Navigate by clicking on=
 any flashing blue rectangles or using the keyboard arrows).<br><br>Since t=
he interaction is a simple on/off, we added the component in the &#39;on&#3=
9; state to the boot options flow. To navigate the prototype, click on flas=
hing blue rectangles or use the right and left keyboard arrows.<br><br>Look=
ing forward to your feedback,<br><div>GUI Design team=C2=A0</div></div>

--000000000000454d68058ca04ca6--
