Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 186EC7043CD
	for <lists+openbmc@lfdr.de>; Tue, 16 May 2023 05:03:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QL1Jp6bxWz3f7D
	for <lists+openbmc@lfdr.de>; Tue, 16 May 2023 13:03:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=oWDWvpWm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=fr0st61te@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=oWDWvpWm;
	dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFx0p6cmsz3bh9
	for <openbmc@lists.ozlabs.org>; Tue,  9 May 2023 21:35:20 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f139de8cefso33274446e87.0
        for <openbmc@lists.ozlabs.org>; Tue, 09 May 2023 04:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683632117; x=1686224117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OAjLxf81Fsfze5ee8+9aMhvLTmCgUl34iyRmfeaLkcc=;
        b=oWDWvpWmPXiPMas0xDaR8hzPYdvhnLLKn1woROGdVxLcwxuV9BcqttRtRA0cmWtbyy
         ihsbuGrOx4GHyPrvBWZTT6q3///KIUz9ZNxQUneDXwkujFsvFQOWfNS/by5X4siTE+kv
         IaTQucgPcC32EY0xooNvWyawTnY8/PTYTsAWrgm1ejhYWIIVYvzjErykVFlVAELzqy5E
         2VUEVjJU/IIUdAI8eGJZdHJEvGu6wnchJ6pcKxf08zwWf2VuPTauDkaq9LK9ykyaBlza
         Sav70WM+Odx6vFLCib0EmAhvuMzmdsSCcL4mK9z9gClTt7bENcNxhacBkFc9ioVHXSpA
         0hWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683632117; x=1686224117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OAjLxf81Fsfze5ee8+9aMhvLTmCgUl34iyRmfeaLkcc=;
        b=FbY2h1zqBkzDmKc8lKHap5sDgsLjfpxYK53K13J9SUksnfY7bQsFHpfsDqfrXvY5cB
         Aknpy4pLdhdvIu7osI2cRvHJxCLC3+sglpwGnaaT16C2e8EQImKFkNyR6Cu15iDbCEkN
         DgF+csimmVlXnPxsEohhc/kZBmrDSxSvKfeMPvK3Ws1NE5cX8NVJGUJadnYPvua8ghGg
         +5/LwUcADmimnc3bSJuP+CfDLoSlg0GkdUOB72Q38RLcUYfW+wgfS29gVcGelSYEI0PU
         rhScVxcOO55cmb0TM3fJYMM1K7zlDYxcTYX9BwAWBMgG3aWtfkjvjZ5W2xLTMFemKzEh
         lG8A==
X-Gm-Message-State: AC+VfDxyadB7THOvTryUuleley1PyesOmYOAcw4XgCiWtfQoJrIJteBn
	IrrNnc7pAJmv47N2oe83GLo=
X-Google-Smtp-Source: ACHHUZ5PaZQJHKJwGOI8X/9RlU8php6koUYl462ViHkvaspmxZuW5PDLG59PrVUywL4GCBO4ywcc0g==
X-Received: by 2002:ac2:4311:0:b0:4ac:b7bf:697a with SMTP id l17-20020ac24311000000b004acb7bf697amr690386lfh.4.1683632117428;
        Tue, 09 May 2023 04:35:17 -0700 (PDT)
Received: from localhost.localdomain (93-80-66-133.broadband.corbina.ru. [93.80.66.133])
        by smtp.googlemail.com with ESMTPSA id k16-20020ac24570000000b004f25ccac240sm108940lfm.74.2023.05.09.04.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 04:35:16 -0700 (PDT)
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 0/5] Refactoring for GMA command
Date: Tue,  9 May 2023 14:34:59 +0000
Message-Id: <20230509143504.30382-1-fr0st61te@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 16 May 2023 13:02:57 +1000
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Ivan Mikhaylov <fr0st61te@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Make one GMA function for all manufacturers, change ndo_set_mac_address
to dev_set_mac_address for notifiying net layer about MAC change which
ndo_set_mac_address doesn't do. 

Add mac-address-increment option for possibility to control MAC address
assignment on BMC via GMA command. 

Changes from v1:
	1. delete ftgmac100.txt changes about mac-address-increment
	2. add convert to yaml from ftgmac100.txt
	3. add mac-address-increment option for ethernet-controller.yaml

Ivan Mikhaylov (5):
  net/ncsi: make one oem_gma function for all mfr id
  net/ncsi: change from ndo_set_mac_address to dev_set_mac_address
  dt-bindings: net: add mac-address-increment option
  net/ncsi: add shift MAC address property
  dt-bindings: net: ftgmac100: convert to yaml version from txt

 .../bindings/net/ethernet-controller.yaml     |   8 ++
 .../bindings/net/faraday,ftgmac100.yaml       | 110 ++++++++++++++++++
 net/ncsi/ncsi-rsp.c                           | 108 ++++++-----------
 3 files changed, 155 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml

-- 
2.40.1

