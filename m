Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D3558F031
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 18:16:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2w7D5vs3z305Z
	for <lists+openbmc@lfdr.de>; Thu, 11 Aug 2022 02:16:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.42; helo=mail-io1-f42.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2w6y40mbz2xmn;
	Thu, 11 Aug 2022 02:16:40 +1000 (AEST)
Received: by mail-io1-f42.google.com with SMTP id g15so6037353iob.0;
        Wed, 10 Aug 2022 09:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=ZagmBS3RLt2DXFkUdXpb10O2Q5NOyVHzikxsSq4fGZA=;
        b=egsAiN3+kF4x9RW/lBxjg6f6J4giR+o5Y+moqlB9b68hgFDOM2YwHoUzHN1vlfo/2C
         o3VEAiDhrBHDKhedojRHAfUEolB+iuohbCHcqulESWbOwF2uBZXTIuGyK4MM2vlLJnDd
         0egVF6VdRkNHzCZPLtEmOocVwfE14KvpA1C5OcsdOcO8ZB5JjPJ9fAhvB1tprg9VmSP7
         znHp8KoGGsYRsOLDkJS6VBalOs5hjzVqKZ6xtH6Ryp6JBoI0lbqzKULHuMzsJvTw8yzv
         HGzU8Y8MZYCCsglvBDeWoZO00loS6rhVdMxQ7+LZ70ApaZ9sbhJtBy4ezw1EhzSpv5Uv
         xUVA==
X-Gm-Message-State: ACgBeo0AATuFfVvvAu9WJv4sEJZQFV0cr/adHK0SWgDhO/R8RgE17jwJ
	5GTI7peQOU0BRZBqG42ztg==
X-Google-Smtp-Source: AA6agR4kCFOTWJkv/aLqwv49A93iQlmHKnG0uw1j2GURDbroSYw9a37PQ3f8uQ610PQLJqel4WWV9g==
X-Received: by 2002:a6b:7412:0:b0:67d:1da6:b498 with SMTP id s18-20020a6b7412000000b0067d1da6b498mr11392424iog.14.1660148196881;
        Wed, 10 Aug 2022 09:16:36 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
        by smtp.googlemail.com with ESMTPSA id z17-20020a056602081100b0067885c5fd94sm2496974iow.29.2022.08.10.09.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 09:16:36 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 0/2] Convert Aspeed SCU to DT schema
Date: Wed, 10 Aug 2022 10:16:33 -0600
Message-Id: <20220810161635.73936-1-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This short series converts the aspeed,ast2x00-scu binding to DT schema.
The binding is already in use in examples which unsurprisingly need fixes
with the schema added.

If someone wants to convert the remaining child node bindings, that would
be nice.

This is part of getting rid of the remaining ~40 cases of compatibles
without a schema in the examples.

Rob


Rob Herring (2):
  dt-bindings: pinctrl: aspeed: Add missing properties to examples
  dt-bindings: mfd: aspeed,ast2x00-scu: Convert to DT schema format

 .../bindings/mfd/aspeed,ast2x00-scu.yaml      | 110 ++++++++++++++++++
 .../devicetree/bindings/mfd/aspeed-scu.txt    |  48 --------
 .../pinctrl/aspeed,ast2400-pinctrl.yaml       |   6 +
 .../pinctrl/aspeed,ast2500-pinctrl.yaml       |   4 +
 .../pinctrl/aspeed,ast2600-pinctrl.yaml       |   6 +
 5 files changed, 126 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/aspeed-scu.txt

--
2.34.1
