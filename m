Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D6327424F
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 14:45:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bwgxz3ttpzDqWx
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 22:45:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2f;
 helo=mail-io1-xd2f.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DSHOWqJ5; dkim-atps=neutral
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwgwL1Gs4zDqQ6
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 22:43:45 +1000 (AEST)
Received: by mail-io1-xd2f.google.com with SMTP id g128so19315315iof.11
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 05:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=PM7YWjcRBeLTE4Jm4vSMwggzoHWXuYMDdJlD4GIbIVU=;
 b=DSHOWqJ5N0sugUJCqNAW1JWhjbnEsMcgllvOZFgHBTfCw5Ewq9nEprF6F9xTSWuiAG
 lBZRqnE0CMQUrfYB2BO6PcneiYd4xiq6HDbydfHZcIGVdgmp8uyS2NtTnVSFCzzKAM5f
 80mnNW2VepwariWBp7dHjTZl7lOMYmAjsRQ9JQy/7csGqs2DdhAxYCHszvM4zn4QZkdI
 q6Q1WmNCYhgr9sdQj+Q9nBFrnHb357Mkot3FFhCs8P23FFxLCRvYQWpXkMpprcBTSTw9
 iRvJIL8JpRd1sz0ipfmesHu7pNqAHmoWGMd+e8RSHOUPtK59bJNk4S+JEQYAFxi/YvOG
 wSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=PM7YWjcRBeLTE4Jm4vSMwggzoHWXuYMDdJlD4GIbIVU=;
 b=pJTREoNT0+TqmYwRhSDKa67vASTwWw6ua082Yp/VlbAkFi0wavsGqyobs2LNqHw7Rg
 gmSiz8cH3DceQ1W/D6CTnojILFGXGGWFhP6u3zV5/ktFqGvDnJzEzhQQEvEtYdVm/2d9
 uBSh6p52HbD4eS2Psau+IB0TCemVz3RuEAG+EFA8KOz9xsMqG6l+7gjuAAGxHina7K6X
 yC2P+E6+kWnv9nnZmSkNW4upKC6PnjFqbuZktKZxYPkqiRxdjAiF4wYDCFytrj5013En
 RZq+/x0SXimbveFB2FI9WagvVfe/idGQiRfLg1+GP3zHGNkiPwnEapk8SLu+sV4QsDCB
 dzdw==
X-Gm-Message-State: AOAM530ceqKilggnvDeRPXP1qx81ox5EkC4501r2uwxx1n0gBLAWmtSw
 KkAFty7iX8NdQFADzaO5LhoWxjI6AcDREt7dxL5Qudsc
X-Google-Smtp-Source: ABdhPJx6V3TMd0tsvm6cobJS8U6osNDNweIjVqyHycQFGkavWYRJM4pe5W6Dkh7Yc7Pl4O/O0Ulaum5s3DW+TBETENQ=
X-Received: by 2002:a5e:dc08:: with SMTP id b8mr3132221iok.13.1600778621436;
 Tue, 22 Sep 2020 05:43:41 -0700 (PDT)
MIME-Version: 1.0
From: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
Date: Tue, 22 Sep 2020 18:13:29 +0530
Message-ID: <CAMRErLMAqtWYwdB1RqDDiForbVZOjGATybUvtQObG7tk5Ek9AA@mail.gmail.com>
Subject: Add Multi-host support in the phosphor-buttons
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000018484e05afe65197"
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
Cc: spinler@us.ibm.com, "Wang, Kuiying" <kuiying.wang@intel.com>,
 vernon.mauery@linux.intel.com, velumanit@hcl.com,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000018484e05afe65197
Content-Type: text/plain; charset="UTF-8"

Hi All,
         Our platform is based on the multi-host with one power(1 GPIO),
reset gpio(1 GPIO) and hand switch
(4 GPIO) connected to the base board(BMC). There are five positions that
can be calculated based
on hand switch selection for the power and uart control of all hosts in the
chassis based
on the hand switch position along with power and reset button press.

The below feature needs to be added as part of the multi-host
implementation in the obmc-phosphor-buttons.

 1. Simple power-button press to "on/off" the specific host based on the
selection key position.
 2. Simple reset-button press to "Reset" the specific host based on the
selection key position.
 3. Long power-button press to "Slot AC on/off" on specific host based on
the
    selection key position(triggers if Hand switch == any host).
 4. Long power-button press to "Chassis System Reset"(triggers if Hand
switch == BMC).
 5. UART console(BMC & Four host) selection based on the selection key
position.

In addition to the baseboard GPIO control, we also use the removal debug
card for
host selection button which is virtually mapped to the baseboard Hand
switch(4 GPIO) to
act as a host selector on each button press in the debug card.

The OCP Debug card details can be found in below,

https://www.opencompute.org/documents/facebook-ocp-debug-card-with-lcd-spec_v1p0

Please let me know your valuable comments.

Thanks

--00000000000018484e05afe65197
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Our platform is based on the multi-host with one power(1 GPIO), reset g=
pio(1 GPIO) and hand switch <br>(4 GPIO) connected to the base board(BMC). =
There are five positions that can be calculated based <br>on hand switch se=
lection for the power and uart control of all hosts in the chassis based <b=
r>on the hand switch position along with power and reset button press.<br><=
br>The below feature needs to be added as part of the multi-host <br>implem=
entation in the obmc-phosphor-buttons.<br><br>=C2=A01. Simple power-button =
press to &quot;on/off&quot; the specific host based on the selection key po=
sition.<br>=C2=A02. Simple reset-button press to &quot;Reset&quot; the spec=
ific host based on the selection key position.<br>=C2=A03. Long power-butto=
n press to &quot;Slot AC on/off&quot; on specific host based on the <br>=C2=
=A0 =C2=A0 selection key position(triggers if Hand switch =3D=3D any host).=
<br>=C2=A04. Long power-button press to &quot;Chassis System Reset&quot;(tr=
iggers if Hand switch =3D=3D BMC).<br>=C2=A05. UART console(BMC &amp; Four =
host) selection based on the selection key position.<br><br>In addition to =
the baseboard GPIO control, we also use the removal debug card for <br>host=
 selection button which is virtually mapped to the baseboard Hand switch(4 =
GPIO) to <br>act as a host selector on each button press in the debug card.=
<br><br>The OCP Debug card details can be found in below,<br><div>=C2=A0 <a=
 href=3D"https://www.opencompute.org/documents/facebook-ocp-debug-card-with=
-lcd-spec_v1p0" target=3D"_blank">https://www.opencompute.org/documents/fac=
ebook-ocp-debug-card-with-lcd-spec_v1p0</a></div><br><div>Please let me kno=
w your valuable comments.</div><div><br></div><div>Thanks<br></div><div><br=
></div></div>

--00000000000018484e05afe65197--
