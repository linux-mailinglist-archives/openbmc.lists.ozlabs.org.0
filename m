Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C219E2F37
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2024 23:46:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2wk63hqqz3dCV
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2024 09:46:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1035"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733217374;
	cv=none; b=CgNDZv9im2zkkAZDBGarY/KfbjaiueqCCPlntlu7pd5rkH1Jx5FvdWLkgYnCHP/EBjytYIBhdMIGOIDjfi6lmqZXgnWw2FMahUMblCR4f7JBHCiBFjle2laiPWqPAG1/Xl9f1MuUrsz4qdpZfLIiF8K0X/p4E0gAExAq9z6zgHQRWRwKVNSLNTS1DCwU/aUIxhvjylHM54nEwMqGlPcC6bLY6WL3U/0Wqd9/3ResEdfIwM1SHmjF8EzHiKjIG3cHQnqVjcV22ZNDztTXjMnKqS0DDnMeaSAz0e3XUUmfJSkCTrCyJ6EzQvS4jka/cwu7g9+uzNtQ5dcqzg2ql5eLxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733217374; c=relaxed/relaxed;
	bh=+SiiyDRalD5xASi8k9BJDefjshvIVg9c+UxPMRyISNM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QvMkVtBJXBHzxcH20fgB9cR2WR03rXiS99S0ceVTJi9gaV5ZNqhV4TAwI/TM006X8fadz7u/lIwxPL7YOL1zEYBMv99pD0tEeab/5vztaEZEi5tfcDcotTEuFcq5NIWQZX4HV4pGWD+wWf7phf2BiqDy0cOk04kfZzDKvHQ6bqxZ1PAguhHyOc3hw6DzqnwlhLv/zRLJ4wvVO21hfAHVncBjrRqEUfvJ52VAO7Pv3SRu3yO+fk1Qj+evkYTbFKy7q7JoFAr1LShclxlq+0h84gRItdnp6c1NvbVEkHPLBWOGoHSfDbOVyy7LNDJXvD7M0cJJAKQzNTd6iTqnBAz0EQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f5jIVGhW; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f5jIVGhW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2ZlK64fbz2yYd
	for <openbmc@lists.ozlabs.org>; Tue,  3 Dec 2024 20:16:13 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2ee8c72b52dso1992312a91.0
        for <openbmc@lists.ozlabs.org>; Tue, 03 Dec 2024 01:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733217371; x=1733822171; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+SiiyDRalD5xASi8k9BJDefjshvIVg9c+UxPMRyISNM=;
        b=f5jIVGhWRx07TrkoTlxpGDI0zMAVOdQ1rAYller1mlYbkFhymRQXVg4E3ghiTpoJD/
         FrMAueCPfC4IynDzVZqIf5BaMl7xy+/SHGBo9K0H54sO7N01Ozq+OQRZmLus9sQX4/ku
         zeCp5bEg9OZc+I9U2M5/Nb1pHJD8lEbYIr2roetCc7W56oQ6KUlHYm+iFMcxEcvQZjaM
         /ZBRcVyyZHZPXPw4PNF+m9eAZFv3cVnaJVkGrEEIwFvgdzpX6fuoh/9254tT1VI0xQQm
         bQer7PTURMhEtKQH4dderGXULBpq+qUU6TAc0Mwe9Tu0HwOPlPTXWIBM6sBCjUqxq7/9
         jKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733217371; x=1733822171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+SiiyDRalD5xASi8k9BJDefjshvIVg9c+UxPMRyISNM=;
        b=cuEBnOcB4j76avSpn5f3ZoMbLpoQnGfSH1JgArpJFOaLx0DZRVUZKXz7haoCWrcUy6
         pqKqzSARwvBTfquuMTPqDMwOc6r6Wjo73kLf8GIrbPeASbYSKn9Q9ITLezEWOheuvhoS
         s1nkofyzu+LQe7wZ7y+uwgIY2Tf0zHyDNGI0Jf8jbYpCaqwgPiVpqIM9qjmEEusp2Jjj
         ahG4eMxvuD5RFvss44ca3dk/SuKAknjUPqwB/fqXNv/kV8AILToWirmB8VNwCKxZpMM/
         qPomQRdwuw9eJ+m5EtzV6jo0WUELtnTDiWo6SLD7NFZeUTmIuWmPwFzlhQOetwJdqUMS
         yoXg==
X-Gm-Message-State: AOJu0YzUdeTlkCozGsXL9TCOKSeknUnfh7lAjb91Bxgx+YpeFtWr+Fog
	dKFSClzsRiOYqpXb4Z3Dr1DN+TkI5kmKsiC5yHKZtv1xA2nnPq3Z
X-Gm-Gg: ASbGncuXTJWZpkeKN7lGfs+Qfo7NGp+Hlq3HCV8Rm281w1EwpB4HMuSwrsWhDK+7cLM
	d6oQ32b/Y2HoLswPcIDZ/MT5t5I+SFc5OMHw1hkGYuBgvcl8vnjBHuYP8Dbvclha+q8E5f1zNQ1
	6aTYLN5XkP2MiO8cgMAGkwk5dGMivrS/gJ4IkvagvklOYCYR7B24eS67/kDm+i/QDOpUBiQHWCP
	7p2yxshDSGnvlFTB/pjq/GTERyLuoEdZDLdwZCa7aKlareiPqYaH6oX1qaxgUvdsmYvOfgBdjN8
	Annrp5wjRygfd1g=
X-Google-Smtp-Source: AGHT+IFgGhE5SLC27Oi1AeRF0rRV8UEqlKW6VpIhPrFpWYx1U5vcw6NF5lfHTg/4SdLEXzNIxiC6eQ==
X-Received: by 2002:a17:90b:3a85:b0:2ee:e961:303d with SMTP id 98e67ed59e1d1-2ef01275c7dmr2455939a91.35.1733217370567;
        Tue, 03 Dec 2024 01:16:10 -0800 (PST)
Received: from hcdev-d520mt.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ee566a9a34sm7713069a91.51.2024.12.03.01.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 01:16:09 -0800 (PST)
From: Eason Yang <j2anfernee@gmail.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	javier.carrasco.cruz@gmail.com,
	andriy.shevchenko@linux.intel.com,
	marcelo.schmitt@analog.com,
	olivier.moysan@foss.st.com,
	mitrutzceclan@gmail.com,
	tgamblin@baylibre.com,
	matteomartelli3@gmail.com,
	alisadariana@gmail.com,
	gstols@baylibre.com,
	thomas.bonnefille@bootlin.com,
	ramona.nechita@analog.com,
	mike.looijmans@topic.nl,
	chanh@os.amperecomputing.com,
	KWLIU@nuvoton.com,
	yhyang2@nuvoton.com
Subject: [PATCH v2 0/2] iio: adc: add Nuvoton NCT720x ADC driver
Date: Tue,  3 Dec 2024 17:15:38 +0800
Message-Id: <20241203091540.3695650-1-j2anfernee@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Wed, 04 Dec 2024 09:46:15 +1100
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
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Eason Yang <j2anfernee@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Change since version 2:
 - Remvoe read-vin-data-size property, default use read word vin data
 - Use regmap instead of i2c smbus API
 - IIO should be IIO_CHAN_INFO_RAW and _SCALE not _PROCESSED
 - Use dev_xxx_probe in probe function and dev_xxx in other functions
 - Use devm_iio_device_register replace of iio_device_register
 - Use guard(mutex) replace of mutex_lock
 - Use get_unaligned_le16 conversion API
 - Add delay 25 msecs for registers ready

Changes since version 1:
 - Add new property in iio:adc binding document
 - Add new driver for Nuvoton NCT720x driver

Eason Yang (2):
  dt-bindings: iio: adc: Add binding for Nuvoton NCT720x ADCs
  iio: adc: add Nuvoton NCT720x ADC driver

 .../bindings/iio/adc/nuvoton,nct720x.yaml     |  40 ++
 MAINTAINERS                                   |   2 +
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/nct720x.c                     | 533 ++++++++++++++++++
 5 files changed, 586 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
 create mode 100644 drivers/iio/adc/nct720x.c

-- 
2.34.1

