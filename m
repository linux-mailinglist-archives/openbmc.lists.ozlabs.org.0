Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D61F190C68
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 12:27:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mpr52BHxzDqss
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 22:27:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=poX+3UDJ; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mppN5lP4zDqsJ
 for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2020 22:25:46 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id l184so9133005pfl.7
 for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2020 04:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iN0awJ9LqpvoFyWbJf9TFI8EBx1VghV4lGI5NVr5z98=;
 b=poX+3UDJeTTAWkeZs4UbL1hGqiI8trwb+gxWBzTzrpD0TKlSZO0XyagT21WEpIuRib
 5XwFi3xMoEstLfJDYgwxMSIaGRwrvReOxcRbwdDI9wSXwJX6j4l1R+zQHEXBjTgzUyPc
 PFlqiVvXk/VU1muovwAl8HjQh9iItUrMjGY7QWsYiMBiHWb9lmPy2MB0VB1ERxk+xbBS
 ZRD2L8np1ax/kY3QbXbGscZ+DdvVSw4y2B3addO8uRWy71qdTTKmErVbJqPXyp+V0xHh
 0Ah0Hm0cMyYHOwdTO5fNqakrfUCXwG4LIGwItXLPp7nsrY4Vo8LdS/co8pWev4Cdvxmx
 wyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=iN0awJ9LqpvoFyWbJf9TFI8EBx1VghV4lGI5NVr5z98=;
 b=g5Y8L+WB9I7kqK6sdohmMukfGhVSk4qRzjg6dSrtb0Z1G3wQGPGgBWgScBhcbHZ0NP
 eywHPhdv7/cKQn0SpCAlSWx/+fMfn7aJLERyvm3a6DhU9H3Nj57MkkHSNxea3hSPahGe
 AdhVHfHQxp+8/NjdWaS1D9fDAxx0vhRVMjk6iiUEe484ZTueQZgq74xs0HoPcX5l3anf
 VMAjl9MkWalG0LuNz2OYyPgpkzb1YQ56v8cqqNKjESlGxxOcGFG0XsCMSm9Tes7iafCN
 rEbvEBl+jtIBl0HFVj2y10PHFh9x0vaq7BakqOEEGKLMtazt57CVpCp4nmF/bafTb+aE
 XjmA==
X-Gm-Message-State: ANhLgQ01l+HK/iJgx5ZdIMv/zbUcv0l4BvoNpHHm4xppuzNrb25VKs1b
 O4Ju9LNbHoNlAzeRX4+mzZ0=
X-Google-Smtp-Source: ADFU+vsirQL57qUgcqYhLWJ58OlJK/rus8yMQUYoSiCTEFrsmlnWwpeHfO47oamNmNyIiyshgiQEMw==
X-Received: by 2002:aa7:9f12:: with SMTP id g18mr12162374pfr.262.1585049142756; 
 Tue, 24 Mar 2020 04:25:42 -0700 (PDT)
Received: from voyager.lan ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id v26sm2824004pfn.51.2020.03.24.04.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 04:25:42 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>, Andrew Geissler <geissonator@gmail.com>,
 openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 0/2] fsi: aspeed: Support fsi pin muxing
Date: Tue, 24 Mar 2020 21:55:27 +1030
Message-Id: <20200324112530.293386-1-joel@jms.id.au>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This adds support for configuring the PCB pinout (not the ASPEED pads)
used for FSI depending on the state of a GPIO.

Joel Stanley (2):
  ARM: dts: aspeed: tacoma: Add GPIOs for FSI
  fsi: aspeed: Support cabled FSI

 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts |  9 ++---
 drivers/fsi/fsi-master-aspeed.c             | 45 +++++++++++++++++++++
 2 files changed, 48 insertions(+), 6 deletions(-)

-- 
2.25.1

