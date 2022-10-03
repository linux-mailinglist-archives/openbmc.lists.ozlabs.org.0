Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D430E5F364D
	for <lists+openbmc@lfdr.de>; Mon,  3 Oct 2022 21:30:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mh9sj1qlzz3bjJ
	for <lists+openbmc@lfdr.de>; Tue,  4 Oct 2022 06:30:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LVvLIY3W;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=aladyshev22@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LVvLIY3W;
	dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mh9r55G09z2xf7
	for <openbmc@lists.ozlabs.org>; Tue,  4 Oct 2022 06:29:07 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id bu25so18036885lfb.3
        for <openbmc@lists.ozlabs.org>; Mon, 03 Oct 2022 12:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=RfoS4oNSl3iLm9QkSJWnFYEHwL243tVfavoKrg1T0Yk=;
        b=LVvLIY3WuSxsvvozIqMiITUrkROIpXub347Se5QIGSy4WIsdtZNq/j21XISAviYZYB
         TR6qcNq20v4v+hQlvxTbD7L807ciG1aD0QqHyLkAfxkAVm5rWsS9PSFdD0gc5PnYZBnY
         2bmKHm62vFXGBooXJjQS1+gT+qaBNO/ugZYw9Pocsw8N5Kwylu7o9+YXNXx5Ai2WcelR
         t4/JNE7tbzPUtPQYLWpY+7G5vHqtjWRg2PBDm/BQULQjDcYmNQgNGDaia4u6nzgsEzxr
         ALQmCK05Ll9+M6PzSCNSuBpulANYYSebNx0oaBupug+gazdydg7L4ygsWaxtISs6tZ3Q
         JrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=RfoS4oNSl3iLm9QkSJWnFYEHwL243tVfavoKrg1T0Yk=;
        b=bafQPPgw6FlRiXgVIHBONtQr/vfEio5K6qRMkluIs9BIR9+6LrqebmPm2xdRr2DIUH
         0/n4+yiDxMfZfLkAIa6h9pYD7kqq52NzTzkiXK5809vCCKsnkT5NRWl4mpatOuoLJraj
         fiyyhMwCzstJlGlFoHvt0B/sMNicGMNhZveKVpdwluaNsAoV3wHEsepecsjrHuscWBwI
         3ZWZ8SGDhtvrhr4ucwPteCA5ukMkEeoQWq0XKze8qXRUelFSPxXs2TJdUbVP5ok4KZNZ
         T4cqn4qSSTL0SLuPSVkvSXOPeNz3p7eCxnRIht62RTIgMHekI6sox39tiAhYz3+kCXVq
         cSJg==
X-Gm-Message-State: ACrzQf3s5hRmZkW9/fxwYHww3k3Ee/O5deRoempoWgzSqM5O4743L/gI
	LNzSLI+MtqDX8jJbuJdnk7A=
X-Google-Smtp-Source: AMsMyM6WZVyjijFH4uQw/75SuDn/yTHGolEjOzA3aE2/E/NNy4FrpBaEZabc9id77sMixhpFnP5VlQ==
X-Received: by 2002:a05:6512:419:b0:4a2:2e45:bf0 with SMTP id u25-20020a056512041900b004a22e450bf0mr3454508lfk.356.1664825342345;
        Mon, 03 Oct 2022 12:29:02 -0700 (PDT)
Received: from DESKTOP-GSFPEC9.localdomain (broadband-46-242-10-176.ip.moscow.rt.ru. [46.242.10.176])
        by smtp.gmail.com with ESMTPSA id j2-20020a056512398200b0048ad4c718f3sm1574195lfu.30.2022.10.03.12.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 12:29:01 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 0/2] Add DaytonaX BMC
Date: Mon,  3 Oct 2022 22:28:49 +0300
Message-Id: <20221003192851.3604-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Konstantin Aladyshev <aladyshev22@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add initial version of device tree for the BMC in the AMD DaytonaX
platform.

AMD DaytonaX platform is a customer reference board (CRB) with an
Aspeed ast2500 BMC manufactured by AMD.

Konstantin Aladyshev (2):
  dt-bindings: arm: aspeed: document AMD DaytonaX
  ARM: dts: aspeed: Add AMD DaytonaX BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts | 319 ++++++++++++++++++
 3 files changed, 321 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts

-- 
2.25.1

