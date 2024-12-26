Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85468A01C66
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 00:13:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRClY3jvSz3fyr
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 10:12:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735192414;
	cv=none; b=mzodI9YK10WuHrsl1UhBaFsY+NB9lEBPJRdkaX3qRb5C+VSgv5a4nWOr2N4JE0fy7l3QSsKYCZ+1K4Ze2U3TQSm5M86bM9lQeuFTJIaXPdJSo1l2fMpwLsMoZx41Qf+9z/IezR/kR8wezK+Zs47OR5U6Ar2vdxRltbGwAxxfEGg5mezXADpho8Tebjcwc5ZZ2TXn/lsWZCYnIxc6G6epodKupGNHaKyJpuB2ppZDGd661t0pQoDs+fyEfHLNXoo6w/ZC9vENOoVQVGLWhceBi8BEz43HUE/ZBKInyNTQbOxaiEsizlfHndWOIlA6XfwnrfzoxKt0H1GbEpWnSUWp7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735192414; c=relaxed/relaxed;
	bh=FeWw1POirV279kyPc1N7G6Ig9OxjD0d5GRNIwt9u/dU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=klgh9ZmNQNspHzvhl2IBAjJU13ZIrum47WGySUBVQpEaPPV4Wf9ZPoLuxn6BC+n1Ff0Cukka5ZB7dISGOnluqn1Mvy4mGEq715r0SCrm+88QkuNLHmm0O7bMP4wHaVC9thEI+Hsfc5lu5uwVxcM+obnLsKp3vlaj+K0yEC+0OrBMfooPY8aM2bDS2Fx8ZS7oGUTzbTRTDDwL4DdjtIG69sT3O8qo8A7Iol3mLnpMQyum6nu2tNuoiXu9n9gnemo3Eeae8P9DiJ8+mEhjjUQQL6knlH8zn5JLvPX98XsTPzbZvjkEEqm9uJWq/cQMyYn9RphvISlEGBWgOEu3gBh2tQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T9at2w5g; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T9at2w5g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YJd8r5xMYz2yD5
	for <openbmc@lists.ozlabs.org>; Thu, 26 Dec 2024 16:53:30 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2156e078563so63172205ad.2
        for <openbmc@lists.ozlabs.org>; Wed, 25 Dec 2024 21:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735192407; x=1735797207; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FeWw1POirV279kyPc1N7G6Ig9OxjD0d5GRNIwt9u/dU=;
        b=T9at2w5gIg1PMmiPvqGXsIo861FSuaWDb4cn1JFtpKKLLOyMxkfmP6+Yb0/JrzlaUw
         nA1CXZmTwssBqoiN3z3k2ffQA0AURHfwKIw3rH3oBjEZSDeimoZDfXf+sEgcI9kPBw5e
         ZeZL/LFAc5Nr+hM55FapSEongp+iybOrTnCupbyPtAmgJsOQ8cL9Xub8MYWU+QfsKGmr
         +agRvw++OvtMWFjSqxs/BbGqb76NkQbzFJFpE1xtr25lzkagKsCLV8m8BcLNeYBJGbHx
         DZKGLE9Lm7+YgzRj5UbzOaD2A4bqjs6PaA3DJjCjLuaDA8AC4aR2gpi4Vxb2d24DZo0w
         KNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735192407; x=1735797207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FeWw1POirV279kyPc1N7G6Ig9OxjD0d5GRNIwt9u/dU=;
        b=PKXTWRB4YG69Tj3hsBp/00Iqc1nYsMt/xevrM87E7Fo7Ll4KnnkmgGzwCjBF8v3MJO
         rURqsQz4KSDZbZqJ4IEfhFRI7eTp64RQLYWC0ADNfRBCrW05TYbbi+JYQJA2h/COsHGz
         zAZecBWLVeMhjPSd66MyPWq9j24FJQpXelrUrFVcD+Xru9j3fhASha5E5tLD9Md6zbjQ
         nhRpdgMTCBmredcF1LbBgeTAivaU+Br/ZufaeoFEdImKQntDb5YLwpL7wPDq89UZ55g0
         pdLhkgRIYIxR3iMoXBhWVYaDRBrY4XGXZJqeuDDYe1k6D01Z9OThPaxxcxL+8wDSi6Z7
         94ag==
X-Gm-Message-State: AOJu0YysPuwWQoWxKdMerrJ5DUZOJehqERpJ7+rEabjo5XnX3Dr0/y8l
	eGw5LmL216zzd4wpnKaFywVtlNrw/JOOl0hU4gQp9Zx/RKqzgLYK
X-Gm-Gg: ASbGnct05iSeHlhoiZDyUuSzbu4WIY/ZB/PpWE867UFx+T6aGvMTSOHd7VwiIAGVKnH
	2anFeMmeB0L9CHNbr5dwAoZewSxIpQEKp8nk/S01Oh6yrJM5JrG/YofbDwRftAWcQ90aasWx7Gx
	hehV/tyLRIFUvOEgF4RfA2jbgQvRM89jJD+qfl4aPegoe717wvgicoU4nbaMP7JlDC/CgZ8Oo59
	orqHl15PMVFTO+3vjqQofpsBnkVFi9ahyb0URwjAhYwzzfeDPMqjmWjrjiFDTKpUHenWOJiuzX7
	2OP8iuS5u8GZJ54T7aREQA==
X-Google-Smtp-Source: AGHT+IFFhwKO4ICta882R38aTBMCAsSh7ScglNr3FCDjMYJyLDyCZlBEzIXsDd8x71I/ifCe9b3iWg==
X-Received: by 2002:a17:903:320a:b0:216:539d:37c3 with SMTP id d9443c01a7336-219e6e9e8d0mr316810885ad.24.1735192407017;
        Wed, 25 Dec 2024 21:53:27 -0800 (PST)
Received: from hcdev-d520mt.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc96312asm112679455ad.21.2024.12.25.21.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Dec 2024 21:53:26 -0800 (PST)
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
	herve.codina@bootlin.com,
	chanh@os.amperecomputing.com,
	KWLIU@nuvoton.com,
	yhyang2@nuvoton.com
Subject: [PATCH v3 0/2] iio: adc: add Nuvoton NCT7201 ADC driver
Date: Thu, 26 Dec 2024 13:53:11 +0800
Message-Id: <20241226055313.2841977-1-j2anfernee@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 06 Jan 2025 10:12:37 +1100
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

Change since version 3:
 - Fix comments
 - Don't put nct720"x" in the name, just call it nct7201
 - Remove differential inputs until conversions are finished
 - Add NCT7201_ prefix in all macros and avoid the tables
 - Correct event threshold values in raw units
 - Add with and without interrupt callback function to have the event
   config part and one that doesn't
 - Remove print an error message if regmap_wirte failed case

Change since version 2:
 - Remvoe read-vin-data-size property, default use read word vin data
 - Use regmap instead of i2c smbus API
 - IIO should be IIO_CHAN_INFO_RAW and _SCALE not _PROCESSED
 - Use dev_xxx_probe in probe function and dev_xxx in other functions
 - Use devm_iio_device_register replace of iio_device_register
 - Use guard(mutex) replace of mutex_lock
 - Use get_unaligned_le16 conversion API

Changes since version 1:
 - Add new property in iio:adc binding document
 - Add new driver for Nuvoton NCT720x driver

Eason Yang (2):
  dt-bindings: iio: adc: Add binding for Nuvoton NCT720x ADCs
  iio: adc: add Nuvoton NCT7201 ADC driver

 .../bindings/iio/adc/nuvoton,nct7201.yaml     |  49 ++
 MAINTAINERS                                   |   2 +
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/nct7201.c                     | 449 ++++++++++++++++++
 5 files changed, 511 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml
 create mode 100644 drivers/iio/adc/nct7201.c

-- 
2.34.1

