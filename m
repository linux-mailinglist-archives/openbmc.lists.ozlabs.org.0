Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47427776F6C
	for <lists+openbmc@lfdr.de>; Thu, 10 Aug 2023 07:15:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=LTCfXecn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLwB20mkSz3cK4
	for <lists+openbmc@lfdr.de>; Thu, 10 Aug 2023 15:15:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=LTCfXecn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=mimi05633@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLQLM0nyxz2yts
	for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2023 19:51:21 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-687ca37628eso2014453b3a.1
        for <openbmc@lists.ozlabs.org>; Wed, 09 Aug 2023 02:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691574679; x=1692179479;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dt9dQKZoqhtasn30KB7Up/m1rU5d0WCMxNZV+DTQ2Ss=;
        b=LTCfXecnkcHGwZXyR1HuHvU5wzUTY5wu3IXntbMdvBIZw0S6Y4V78XnSb0kwGdSPkN
         4LpkupfdgmEx0QKEPZXmSPcqyvPkc5EEEWJI7R3PLuzB6uBad/jdkpFSxQ1EA1SSGGOF
         PGaC6QGR/BDWG0A4uaj1W80pu9u3FqIz3mosLZc6RCt+9MDpVoy6O8f5soyTamTp01E5
         4K5OD6d0Dxmt8guWI20MdYHpLWumFfuHmNnjh0h9E56yPbk3G6Litg3E9hMxW8f+yixi
         t7sYJ0j73x7zztge/M7HqjDCGSFvfCbRz2rAQJap9Qjj+uAG+DtqyAXdNIXYTuG2ZtOg
         mNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691574679; x=1692179479;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dt9dQKZoqhtasn30KB7Up/m1rU5d0WCMxNZV+DTQ2Ss=;
        b=hlCfnI4nHhvX+i4pX7EyyO06oBQNsjqOdDik4CqY1UzTn4mrO/Woq/ULku+9J5ZKQv
         eneyJWFlTKO6q63I8paTBNT2LWPFOGkE4uUP5t4twQb7ob8JzhjzhASCxhEZutULjKhg
         Qk1aqbtm1/O00qOg4eecxRg9F6cr9jHe5E2UwpNa6iTxBn7qR6fgrlyf/+mmYaIZrT4h
         Na4lroMOjqRwa6aKNBCF0nCCHtLuwRGmDFWRhahfPdMFvwU/6lZLbCFQPqyYAbfs47kY
         QZDjEvY2OahzZ9hgtdstbgy7lUf9JCxY6rXGCgBoJLRUyrQj1epvwEXx5Mtg6Fk2f5Rh
         ZWQA==
X-Gm-Message-State: AOJu0YwERifFWnyZ0smSrXhc7aJ4D0AJmZ9YRP3mfWHF1KEvcLSbdkZF
	0MR8Z2Tv+p9/zGeALC7mnnA=
X-Google-Smtp-Source: AGHT+IGZio4gfn9u9Y7XLZnq7XVmcq9ZF76Kzn3wLjKlRZMQA2enJpEfxlEQb3VsmRK+89eeZtL2lw==
X-Received: by 2002:a05:6a20:5504:b0:13d:7433:2ebf with SMTP id ko4-20020a056a20550400b0013d74332ebfmr1983829pzb.60.1691574678454;
        Wed, 09 Aug 2023 02:51:18 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id j21-20020a62b615000000b00687375d9135sm9493822pff.4.2023.08.09.02.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 02:51:18 -0700 (PDT)
From: Mia Lin <mimi05633@gmail.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	KWLIU@nuvoton.com,
	JJLIU0@nuvoton.com,
	KFLIN@nuvoton.com,
	mylin1@nuvoton.com
Subject: [PATCH v2 0/2] Compatible with NCT3015Y-R and NCT3018Y-R
Date: Wed,  9 Aug 2023 17:51:10 +0800
Message-Id: <20230809095112.2836-1-mimi05633@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 10 Aug 2023 15:15:25 +1000
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, Mia Lin <mimi05633@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Changes since version 2:
  Add DT compatible to check the chip matches or not.

Changes since version 1:
  rtc: nuvoton: Compatible with NCT3015Y-R and NCT3018Y-R

Mia Lin (2):
  dt-bindings: rtc: nuvoton: Add DT compatible
  rtc: nuvoton: Compatible with NCT3015Y-R and NCT3018Y-R

 .../bindings/rtc/nuvoton,nct3018y.yaml        |  4 +-
 drivers/rtc/rtc-nct3018y.c                    | 88 ++++++++++++++++---
 2 files changed, 81 insertions(+), 11 deletions(-)

-- 
2.17.1

