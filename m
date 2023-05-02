Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 438426F4B98
	for <lists+openbmc@lfdr.de>; Tue,  2 May 2023 22:49:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9sdM0pldz3bgr
	for <lists+openbmc@lfdr.de>; Wed,  3 May 2023 06:49:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=XbfYeLLP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=XbfYeLLP;
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9scl4KXxz3bkM
	for <openbmc@lists.ozlabs.org>; Wed,  3 May 2023 06:48:54 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1ab0c697c84so9753745ad.3
        for <openbmc@lists.ozlabs.org>; Tue, 02 May 2023 13:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683060530; x=1685652530;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7zjjc4rUGwSGu1pQ8CkBNzY2PQzxJputS0rlb1sjy/Q=;
        b=XbfYeLLPrcU04rl4yZ3vAtELg3wmAuUvhrDslqdXEBwgf1ClO60pURT2XUIZR7W2N2
         LFSmjj09HfnhrTc4KOBoOfSNVD9VIZlklcE6wm5KZw7JmjYKPXgnRelA/d7oE+MBTxv0
         aUh2HkC/6iaQW2NyIyQeMuALmbw/9U5zIqiGRWviyrh6MITQ0kLAjEyHdfiIi+Qw42YY
         QmAMJDmYGYUHkFnrj1wrnWIMeSRyGSdJnFvhq7sHHmwtX1YCkol0xHcSvBqlfeId9T/v
         F7+3eM+T5SZ7qiZsYc/E4od9m2klAIh1eytvsFB+P4484MCnxkSoPlNIScTrKFhxux54
         oj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683060530; x=1685652530;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7zjjc4rUGwSGu1pQ8CkBNzY2PQzxJputS0rlb1sjy/Q=;
        b=Hbj0hxfyihNDfSqRWatc5h2ch7mXCDvODz9sgFqpfFLZTEuvGvBA0gqD9kdAJX/eRv
         KM9JcPqRtooGei+Q4TEbwAPnIGT5ptH4YPlHSCK8IqbZkRUEh98Bc9s8ZcrW/bqtQglp
         U51lKiOOYpeWSJOmEzb7sWuKCwADiIK9EK9OF+hbJ5jpzSPpIk7mIUCabV4Sjfr9paTG
         B5CMEuvM1GypdMpXgam7FVg9oH/BEhaLg56XX2ugpUhfKazbq6EgJT7K6X/0oepWWDqW
         NzoFSg7s1/8jZoeMM0+vGyUmHcX/cuB7HoHaA9M2o+chskJoFym5cCVa5H/6/mMU7i63
         g+nQ==
X-Gm-Message-State: AC+VfDwSK6gltulTJqI9p93UvNqmWfReJeTLND8B0FXd3vmz7eHD0pMy
	2wttPn4J8gZtkNtuNXBF/wWmcxxtZ/E=
X-Google-Smtp-Source: ACHHUZ70JlOx7+J8AX78G6oOKRq7oBQqDEKOB7KRG3zkiOukCoo1Jtx+PJyquDhHu8UwIcGAJSRIng==
X-Received: by 2002:a17:903:11c7:b0:1a5:1438:9bcd with SMTP id q7-20020a17090311c700b001a514389bcdmr21219926plh.35.1683060530038;
        Tue, 02 May 2023 13:48:50 -0700 (PDT)
Received: from smtpclient.apple (184-167-248-253.res.spectrum.com. [184.167.248.253])
        by smtp.gmail.com with ESMTPSA id ba5-20020a170902720500b001ab0a30c895sm1917004plb.202.2023.05.02.13.48.49
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 May 2023 13:48:49 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Preventing a system power on before BMC Ready
Message-Id: <0992ABFC-7CD8-4E4E-8731-167E59C8A9F7@gmail.com>
Date: Tue, 2 May 2023 14:48:48 -0600
To: OpenBMC List <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3696.120.41.1.3)
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

About once a month a bug arrives internally where someone has powered on =
the
host without waiting for the BMC to reach its Ready state. Our systems =
for a
variety of reasons require the BMC to be at Ready before initiating a =
system
power on.

The defects are usually returned as user error in that users are =
supposed to
know to wait. Our Redfish clients (including the web UI) know to not =
allow a
power on operation until Ready. Recently however we had a bug where our =
external
Redfish client allowed a power on before Ready. That client is event =
driven once
connected to the BMC and because they never got an event about an =
unexpected BMC
reboot, they allowed a power on before Ready when the BMC came back up. =
Granted
there is only about a 30s window where we have a problem here, but as we =
all
know, when there's a window, someone finds it.

That got us brainstorming about some possible solutions:
- Write some code in bmcweb to send a =E2=80=9Cbmc state change event=E2=80=
=9D anytime bmcweb
  comes up to ensure listening clients know =E2=80=9Csomething=E2=80=9D =
has happened
- Add an optional compile option to bmcweb (or PSM/x86-power-control) to =
require
  BMC Ready before issuing chassis or system POST requests (return error =
if not
  at Ready)
- Queue up the power on request and execute it once we reach BMC Ready =
(not sure
  what type of response that would be to Redfish clients or what error =
path
  looks like if we never reach Ready?)
- Find a way in the client to better detect an unexpected bmc reboot =
(heartbeat
  of some sort)
- Push bmcweb further in the startup to BMC Ready, ensuring clients =
can't talk
  to the BMC until it's near Ready state

Thoughts?
Andrew=
