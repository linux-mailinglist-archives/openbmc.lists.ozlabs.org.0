Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8558AD9041
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 14:00:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tW821RL6zDqsX
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 23:00:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MfzYvlhu"; 
 dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tW781JJfzDqkp
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 22:59:30 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id e13so5961416pga.7
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 04:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0oC3vDhdgS+TNNLZKRqmEGNhwdjtpdSDK1JJx39qDYM=;
 b=MfzYvlhu3qIvtTX9GORadmmlrr7GgatJ9y9jOe+1ybLl3rcsr5KGOexGdeAvdPTCGD
 2woeaTkRG4HANzK4Cugp00E1Hs9T/9nRzFygmP643pK1y+I44OymW0TsIxBIwSGP1ufG
 LQ3X2IDbrg9KV36mvqxb5Hon3boG5NE13vhcNYSXbco/cOADeZu1cYUQ9+4+C4fDXsof
 IdLd2IQCQ0dv1bGNA5msKQn2ldFB4MsL/R93PomU9W5IPDuKQiaE00WzYhdAZbn+SHgE
 DND0jtIwfHOPg2tdZpMQzBMObh2Ebm+e1MBnW9OG/nMOX36v7/ieH7qUGcdsHnnApwpU
 NT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=0oC3vDhdgS+TNNLZKRqmEGNhwdjtpdSDK1JJx39qDYM=;
 b=EdqNtWVNrHLTH6DBDVXMU6RaBSgr53DqO6Fo5ot9uussNl36J90sFiCqp0+NKy4i//
 4BDV4uZR2VysCFK5cr9xOXy1vDeevApuxzEhb/gGyFSP2v6ZeDY+2HTDdzrLSPYSJ1zQ
 Jzxf/bzmyv88a7T7ShL0GZshx4+vhYGskb/VAssqdPJxDNohSoc87cp5S4sNIQkClmWj
 FGQ/0fcNstpfJjyXQ5N3ctKTzDR6SUZW9rw1hojs9aZl2TcwBQB4uI+f4cyI6SlY0sWK
 shIAIDi/eI7m37w8U6e2xq0tUkZKqghmtlM0GORp2ffSXznoOUCWRcKk63OiEbpBVCru
 UO6w==
X-Gm-Message-State: APjAAAU1HNvHF4cM0Xps/EiSUhYktoP5XdB3PlLpv9XdZBPKynYtSW7B
 sgPEc3cg+8f1BaEaFhdiGjdSEj7/YXA=
X-Google-Smtp-Source: APXvYqyi7a2IroQ2100OZ7HOQoVYftUT71qOXjyJl2ox7eXpcH0DinbnTmlaSWOtNm3E1y1JWO18+A==
X-Received: by 2002:a62:1b45:: with SMTP id b66mr44472452pfb.34.1571227165770; 
 Wed, 16 Oct 2019 04:59:25 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id d19sm2561396pjz.5.2019.10.16.04.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 04:59:25 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 0/3] AST2600 UARTs
Date: Wed, 16 Oct 2019 22:29:00 +1030
Message-Id: <20191016115903.24663-1-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the rest of the AST2600 uarts and enable the workaround as suggested
by aspeed.

Joel Stanley (3):
  ARM: dts: aspeed-g6: Add remaining UARTs
  ARM: dts: aspeed: tacoma: Add UART1 and workaround
  ARM: dts: ast2600evb: Enable UART workaround

 arch/arm/boot/dts/aspeed-ast2600-evb.dts    |  5 ++
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 15 ++++--
 arch/arm/boot/dts/aspeed-g6.dtsi            | 60 +++++++++++++++++++++
 3 files changed, 76 insertions(+), 4 deletions(-)

-- 
2.23.0

