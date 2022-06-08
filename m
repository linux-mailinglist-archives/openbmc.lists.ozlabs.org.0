Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D9F5427A6
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 09:45:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHzm36kLgz3bqJ
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 17:45:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cDiIzVsb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cDiIzVsb;
	dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHzkz4wCLz2xn8
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2022 17:44:26 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id u18so16957758plb.3
        for <openbmc@lists.ozlabs.org>; Wed, 08 Jun 2022 00:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hpsnrFVgDHy6XpmnTsQ0xC8NWbdvzEJA6dWuqFDD1tg=;
        b=cDiIzVsbmLaNZY9IZchQGgxFP3q5HhzFv+QY2nATcH5aJoq5OEdRhrxVWZPTPz9TCJ
         SgXBVxgWRDimKValo9susWY758oQhSA/hEYGxIS5fKNrnx1xJnO2PrYMROxPmVP1qr3a
         yir3DZ+uoKRMYBE1iwJ+BUZQK7K8nbZChKzCgR8F5EF8tPD0Heyu3ZLS2q8JgREC5cR6
         2LbSBtc1hKyC3j/a6UzfnNI9bDOts3fqmWaKUTx6zebJlu0QvmbB4RavPa+GcqGW1k/l
         rsgjAX0Ctzl4sdBWUHKOMPjxKCpA74lDv45vyaKvoZuvKVLGMgGzdmTqoFX46oM4HMtH
         anTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=hpsnrFVgDHy6XpmnTsQ0xC8NWbdvzEJA6dWuqFDD1tg=;
        b=YjgZdwNEpaJPH8Wbti9j/h9Vaw/PgwDDqaFoqfuPK6PJY8QJL7p1PDGh1CcukV9HM8
         cMhyMDRK+7me0ciZCDuLWfFjNwPOA3W1JpB2Ti0Yo5GPzek6/kaV6SEWnnsuGKatvBr7
         meDWLvDwJky8YhQgai0vU9oEiX5Zb/Z6stbP+t8c+8V3dJQ1No+D7+A8xGvUl7qQ0Rh/
         rnzL+ytCxhdRw8p6G8+4fjWgESlWhvW7e6GgML2u/GQmzf8EWIXL3nIKzkpYf/4hvWfZ
         HaQGjuE5J53m5KWOEpGMfCA34Wk0gRDi6hrtu8c8H/cSHJUvWqL2ilM9WtamSbiUHBvR
         uJhQ==
X-Gm-Message-State: AOAM532OYYqmldDLimIlPM8/nBylBYzJBVcComlLU1CoJP+HCKSPCIYY
	YRenzsupA61T+5LdJXPRZRi1m0YQC2k=
X-Google-Smtp-Source: ABdhPJwZ7W1jYxfubnhsqZkIij2i6tH2fIky71bePuulzouncja/FpaMUD2F3FFrdo2r8L5zROmwGA==
X-Received: by 2002:a17:902:ce88:b0:163:dbd5:9797 with SMTP id f8-20020a170902ce8800b00163dbd59797mr32895769plg.82.1654674261519;
        Wed, 08 Jun 2022 00:44:21 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id i13-20020a170902c94d00b0016362da9a03sm13955693pla.245.2022.06.08.00.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 00:44:20 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 0/3] Consolidate dts
Date: Wed,  8 Jun 2022 17:13:59 +0930
Message-Id: <20220608074402.1876079-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This reduces the maintenance required for the device trees by having the
variants of the AST2600 EVB only contain the things that differ.

Aspeed, can you comment on the A1 device tree? I wasn't sure if the eMMC
timings need to be different. If not, we can get rid of that device tree
entirely.

Joel Stanley (3):
  dts: ast2600: Consolidate A1 device tree
  dts: ast2600: Consolidate A0 device tree
  dts: ast2600: Consolidate NCSI device tree

 arch/arm/dts/ast2600-ncsi.dts  | 294 +-------------------------------
 arch/arm/dts/ast2600a0-evb.dts | 264 +----------------------------
 arch/arm/dts/ast2600a1-evb.dts | 301 +--------------------------------
 3 files changed, 11 insertions(+), 848 deletions(-)

-- 
2.35.1

