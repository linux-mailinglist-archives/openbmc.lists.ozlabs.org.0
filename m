Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1B08D58D9
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2024 05:06:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=BokKH45L;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr7LW2RzVz3cYf
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2024 13:06:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=BokKH45L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vr7Gp2v09z30Vl;
	Fri, 31 May 2024 13:03:13 +1000 (AEST)
Received: from [127.0.1.1] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 97782200E0;
	Fri, 31 May 2024 11:03:06 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717124591;
	bh=KcNJCLwnq4RAZ/qwQckgdLlOAEGHpzhWwOSzLGWplOk=;
	h=From:Subject:Date:To:Cc;
	b=BokKH45LooJ+L8pFLyk2x6SZnVKAuyBU+wMXbLJMDLigf4A8uxI2bMP+q8FGxgTuG
	 SJT9EkAbkhLUd+lYfeXrInmK4XavfFBhwq8lSSOeECK4GvqV2XOfE0ytgOhhP8LC0T
	 0jXzTaXvAMhQCQBkpqKHzf8wFdlHcClGY6wVutk4FHDskhkcdEaCTHZy6N/jN6PDGF
	 5a49/bchnLENwDWKdbhEk06SpBaF84JWfA1S1Ypb5uEREKBGtseWVZVWEKRLwC8aUB
	 jr+UkUjWXPN7/4au7Dg2WQkd5L0JzxW/zxYsXk/Csft/zFCDbCqRWNBCh6ZWqjakcD
	 5hNzfUPJVCUSQ==
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH 0/3] dt-bindings: pinctrl: aspeed: Define missing functions
 and groups
Date: Fri, 31 May 2024 12:32:46 +0930
Message-Id: <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-0-a6fe2281a1b8@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANY9WWYC/x2N0QoCIRAAf+XY5xbU7Ip+JXow3bOFWMX1Kjju3
 5Meh4GZDZQak8J12qDRm5WLDLCHCeIzSCbkNBiccd6cjhZTx09owpIVc+WCQbubjcHKEnt74bJ
 KHKqVtSqS9bMPZ5cu/gGjWRst/P3/bvd9/wFsjBL1fwAAAA==
To: Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
X-Mailer: b4 0.13.0
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

Hello,

This short series cleans up a collection of binding warnings concerning
use of undefined pinctrl functions and groups. Together they make a
reasonable dent in the volume of output from `make dtbs_check` for the
Aspeed devicetrees.

Please review!

Andrew

---
Andrew Jeffery (3):
      dt-bindings: pinctrl: aspeed: Use block syntax for function and groups
      dt-bindings: pinctrl: aspeed,ast2500-pinctrl: Describe SGPM
      dt-bindings: pinctrl: aspeed,ast2600-pinctrl: Describe I3C, USB

 .../bindings/pinctrl/aspeed,ast2400-pinctrl.yaml   | 169 ++++++-
 .../bindings/pinctrl/aspeed,ast2500-pinctrl.yaml   | 188 +++++++-
 .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml   | 507 +++++++++++++++++++--
 3 files changed, 781 insertions(+), 83 deletions(-)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-e1464a72d84b

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

