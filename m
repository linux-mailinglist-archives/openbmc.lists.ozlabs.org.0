Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA50472331
	for <lists+openbmc@lfdr.de>; Mon, 13 Dec 2021 09:46:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCFVc6w9Mz30R8
	for <lists+openbmc@lfdr.de>; Mon, 13 Dec 2021 19:46:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NPbIgNqn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2b;
 helo=mail-yb1-xb2b.google.com; envelope-from=tyler.sabdon@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NPbIgNqn; dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCFVF6smKz2ywB
 for <openbmc@lists.ozlabs.org>; Mon, 13 Dec 2021 19:46:27 +1100 (AEDT)
Received: by mail-yb1-xb2b.google.com with SMTP id j2so36426090ybg.9
 for <openbmc@lists.ozlabs.org>; Mon, 13 Dec 2021 00:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=RH2DyVwgK0TyKCM6UC+lz2hJH5cjjvxGtiBE0hsTsZI=;
 b=NPbIgNqnLog6ubW5yVzMAjPfCIdiVCYj7aRxJBV/7Bi7g1SGx6n+05TKBdMWAFu/qX
 Gk/pDm4TrFKBzbV5vBEgL9VOr1tdY3zTP4TPDPI7OBHpM/crZ42qXNRflve7E9763VLi
 TOw5OE/Lqh5t0S96jfobY1Q065fInualZ2b5uzVRuDt96FBMa+rrISgKozr/xgkugw6C
 yYL6Yxya+IqFZAjpIgDO01Ls33Fez/rFlQf2IIR85EhLosslpUA6p7Z7bfkRszOh5jBK
 lJMA7NckZxurwRAPTIEcTEzBMLaOL+w+Gbl0oRfinxoCyYKonrv//IkBHY6KhtVuNRyr
 hZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=RH2DyVwgK0TyKCM6UC+lz2hJH5cjjvxGtiBE0hsTsZI=;
 b=w5Q+8ETGPZt0MYpCpdCxrzfXMvMNPtNajLkFRbImZgVeQNn9VFXXOxD7C+xlVp1jck
 G82GaRbziOeOza3MzfyfBPs7iAllEpebdBo7YkZLNSb7hpaJe6UuWnUx/7gdh85soaL8
 yTde5A+q3SwAZ2F/fTS67nZIzZgYuw2WfxmlD1+oyYXRP34Mo9Axq6BtWpvUf0FgwHD7
 1S9ag2/ELNDZry7MYESpYQUc5ASxlnjn5X1/eHLXbDrNpUHvkECKEYPDd/NA2uS9Ewyg
 TPoLwrgcbHvZXWpRTTOkDBV3GNkiaqb880YaMKoyXnA9piyahbMKgzKnyvnfvogER1oN
 dGQA==
X-Gm-Message-State: AOAM5327ED6V5POBLGkOp1NNt8/bGyWdSSTXTHC56Ld2Z8lSdu4ZyEeo
 +8tiVt1/u9AGPFkAsUtE2e1Md9VYs9gbbtTRLDZZH7Q5WiY=
X-Google-Smtp-Source: ABdhPJxJqYKSNDvUrV/om5LlFMDGrSCXKVIAL5t1l6WgJO3ADVghscE34AzVXRwixepDibjtbklvw9laDSHO8gXVgxA=
X-Received: by 2002:a25:c5ce:: with SMTP id
 v197mr31941478ybe.152.1639385184008; 
 Mon, 13 Dec 2021 00:46:24 -0800 (PST)
MIME-Version: 1.0
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Mon, 13 Dec 2021 16:46:13 +0800
Message-ID: <CAO9PYRKmup17BSTLNLdBMO=-HjQ2Lxw+Gcw7+0VY8DKVMed9GA@mail.gmail.com>
Subject: Run unit-test during development
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000008aff5005d3031b27"
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

--0000000000008aff5005d3031b27
Content-Type: text/plain; charset="UTF-8"

Hi All:
    Is there any easier way to run unit-test during development instead of
running run-unit-test-docker.sh?

BR,
Tyler

--0000000000008aff5005d3031b27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All:<div>=C2=A0 =C2=A0 Is there any easier=C2=A0way to =
run unit-test during development instead of running run-unit-test-docker.sh=
?</div><div><br></div><div>BR,</div><div>Tyler</div></div>

--0000000000008aff5005d3031b27--
