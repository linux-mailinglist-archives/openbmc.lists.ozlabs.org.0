Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F18477693
	for <lists+openbmc@lfdr.de>; Thu, 16 Dec 2021 17:04:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFH3j562yz30Pj
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 03:04:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=tS7ZRljs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::932;
 helo=mail-ua1-x932.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=tS7ZRljs; dkim-atps=neutral
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [IPv6:2607:f8b0:4864:20::932])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFH3L0glwz2xsW
 for <openbmc@lists.ozlabs.org>; Fri, 17 Dec 2021 03:03:41 +1100 (AEDT)
Received: by mail-ua1-x932.google.com with SMTP id y23so6241556uay.7
 for <openbmc@lists.ozlabs.org>; Thu, 16 Dec 2021 08:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=NHnHtz0q1sdj5N9xqVTMfNZfORE4R6qlqQqQ2bxTP/s=;
 b=tS7ZRljsUSoez/QfAjsiTJhOC5Yq1UPRMmkOCf3rcWzKeZNVoHXhxFNkZNN4DFOW5H
 9tTAJ7ar6NUDC6/y9igl3XYl7csegX5ljB8Wx6c1bDmRNzufHehky6L7nLQFeIO+DnXZ
 04QJo7uccirvYNh+I8yt+m3lRiyJAS0aGTaC8erXlCdbA41PgZ4liPhkqgV9vOEcJc1I
 43lrgLKlQIuscviAi+ocEn2Eb4uDHr3IEAqG9UhVJ0ZDQRfhAcQcobQ8lBsEtPmlK2SZ
 wooT5G+ie7pcdTz5JdwS7t9GU+/GJpg3WOL0gu8VBWxpJ5IdfF8m56bQ4TzO3fcl4nKi
 sGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NHnHtz0q1sdj5N9xqVTMfNZfORE4R6qlqQqQ2bxTP/s=;
 b=gnqdGMMoipd7hWLw7EoqGax+STc6hA1eROw83a9QGIxqccNTGVPqdOtZ+mA3H5wiC6
 yxXzmmNCDRodx4Izdo37qL/pg8pbiu7alVicHLL61YEmmU9QsMtyJ0291xWmC2S0Z0lw
 dj1NcglT+oNcuZ6e6Gz6heB++1giIVT76crDXRMSspwoMN7cc2/Im5f+00mRfMun65dk
 TptxhAl2bcOBsnADm2wJ7OgMNIqpp4R/ueoLUpAWOEhp5NvkGbcZVJcPIXBc5Ujx52dg
 D521nkCJ7IyTEUxEqQVBNqiT+6PZkTCevpkpYQX/vCgLmtvlJQFppdjPvyRFKsMiTq/b
 upZQ==
X-Gm-Message-State: AOAM533jGi/Ywf5ZgMarTtcUOqXnjR0TElKdMeX3MhanPw5bA8CSmv43
 /uSYRLClr9sJadcDewzS53X8YAe51zZ4N4+q96PUbQ==
X-Google-Smtp-Source: ABdhPJzHRLWuZBpOB3biKzOGmysRccIhjXrf2LePoxMPPVuTFy2saFgchE6GFbFYq1yAW/gpsj3YWpZTcq8y3DIlBTE=
X-Received: by 2002:a67:fa12:: with SMTP id i18mr5644236vsq.49.1639670617648; 
 Thu, 16 Dec 2021 08:03:37 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Thu, 16 Dec 2021 08:03:26 -0800
Message-ID: <CAO=notwUAezOS58BBPL4-fzENrUj55Tbdi1Lwvjz1Y_vpc69uA@mail.gmail.com>
Subject: Introducing PECI support in Qemu
To: QEMU Developers <qemu-devel@nongnu.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Titus Rwantare <titusr@google.com>
Content-Type: multipart/alternative; boundary="000000000000b71a2805d3459041"
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

--000000000000b71a2805d3459041
Content-Type: text/plain; charset="UTF-8"

Hi all;

My team has a working PECI bus/device in Qemu, but we only have internal
board specifications that enable it.  We'd like to upstream it as soon
as possible, but obviously we can't enable testing for it without an
upstream board that uses it.  We only have it attached to Nuvoton 7xx
presently, but are slated to enable it for the Aspeed series in the
next quarter.

Does anyone have an upstream Nuvoton 7xx series BMC board that has PECI
enabled in the DTS, where we can enable it to their qemu board to enable
the upstream testing? (think: qtest).

Patrick

--000000000000b71a2805d3459041
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all;<div><br></div><div>My team has a working PECI bus/=
device in Qemu, but we only have internal board specifications that enable =
it.=C2=A0 We&#39;d like to upstream it as soon as=C2=A0possible, but obviou=
sly we can&#39;t enable testing for it without an upstream board that uses =
it.=C2=A0 We only have it attached to Nuvoton 7xx presently, but are slated=
 to enable it for the Aspeed series in the next=C2=A0quarter.</div><div><br=
></div><div>Does anyone have an upstream Nuvoton 7xx series BMC board that =
has PECI enabled in the DTS, where we can enable it to their qemu board to =
enable the upstream testing? (think: qtest).</div><div><br></div><div>Patri=
ck</div></div>

--000000000000b71a2805d3459041--
