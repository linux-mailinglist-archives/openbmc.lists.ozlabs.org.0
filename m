Return-Path: <openbmc+bounces-1078-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 390B3CE5B6D
	for <lists+openbmc@lfdr.de>; Mon, 29 Dec 2025 02:51:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dffMJ3P6Wz2yFh;
	Mon, 29 Dec 2025 12:51:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766509334;
	cv=none; b=gbdN1mMuhtE1M414qgveWAzndLEWlO2dM2zGL/1jrrp5wAW4CMrxSorcZW/oJhAq8SOcmCWpkC0swo+6g+CCa3Ztt1RJkdBnprqDDzhM5E5ogMJYfdKp0D3ILbw+nFABQ9cbEg75HopVTmP4YvuqMGl/MJxyhT3IHK5Z7RrIp4i0bXZAPBRCvT4kFcYi1YzGzebU1NPRH7sTGhvclWQpOwTR69YWrpppsfebrcebAbBFDcTbVTIgi5oJoPhWr2VPM3UlPSmQlP00HFLUGeQoxj9VenTbl+0XPtkKs6uAEEOxacPiI+BlWCzGbB0BXOjETVJoL5i8cbR2fXxuFJXUcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766509334; c=relaxed/relaxed;
	bh=jiVMsPmbQP7FZ38DNLit/HG1+5z9nnDnXvMaFIBjNjQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UYmKCBP/4b5BdhxK9KLtMx4b4NjMS9FGhIgbehV6DEDOKRyiE+pXkmjtCIpcsfYdu3S3JSKEFfVJaBrW6YiygAZcjokrhTZpssk/byXXKopuHht1j5nwhSZzvH13SgPi80XzTgvtzmDpsV5GBAsfE9ZlcABVm/H6VQHX96DsneYuAjTY5xtGVpsAL+FX3zvitGm4GOG6fBQ1drSsqlBN6Bh7776eSavl7r/h0n5pNScYcmR43Bo+EX0QRiWNbW6i7t6SWh0kXOYE3+2OhaTlZSfnW79Z2u0QvgTjcE4/MkuI5kRBpP2i+AxgRo0GrM3jH3tRZtM44ClXRC3Kv0hmSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dY21izoQ; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kVId+lS3; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=manivannan.sadhasivam@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dY21izoQ;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kVId+lS3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=manivannan.sadhasivam@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbLsL0XKcz2xXB
	for <openbmc@lists.ozlabs.org>; Wed, 24 Dec 2025 04:02:13 +1100 (AEDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNErsbW461342
	for <openbmc@lists.ozlabs.org>; Tue, 23 Dec 2025 15:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiVMsPmbQP7FZ38DNLit/HG1+5z9nnDnXvMaFIBjNjQ=; b=dY21izoQwZl3PUWu
	Mb6XE3I9EdcKQO8QjSqkx5MLvjiEwvp7/oOdtyn2XSuWlTf3zVnBSDfvpxeh+aLG
	uQViOdMN53cJFkPMxDxc7Tz0MrWKgjfFGwWea8YMW8CmOrD3Q9+uVH0+5tnsI3Ed
	vxfom/ISfZ5X0F9jEgVbRIeCNtAtVoQ28hzi3zolpSY+3CY1+Dtd3NVZJYHXipJu
	fTZdrdKIAAJ/Pd8qfzGX1MKPf2bTnUOKAR/WlTEpR4vdpBVwdecu0c2rn7UvVrN/
	YmCQbg4NE2gSVOFz90F80BXLJDXxr/mJHWJxz2cna19+/98SeU6WkHbCYNzBY/kS
	QCAYsA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8fr62e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Tue, 23 Dec 2025 15:58:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0dabc192eso113153245ad.0
        for <openbmc@lists.ozlabs.org>; Tue, 23 Dec 2025 07:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766505514; x=1767110314; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiVMsPmbQP7FZ38DNLit/HG1+5z9nnDnXvMaFIBjNjQ=;
        b=kVId+lS3Zc9kUThkytI3LwpDH8v9wPim4uns4iPGuVsuXZEj/FeaDFHRGIbkkfLGMP
         EnZDTvqgMP2PzlJlZns+ugepgdnfCURiIeETFa0pHXR7oFoVEZ8mXv4PC0UGr9v8AMk0
         hHGDV9PRHo13gcTSgv8afe0/7jDZ1OwcYOB36eTAZ4aL1hwGdWNGYToRS7Y9a++DDizo
         djPS92xpytg8QMxCycoVyoOpGxGZ/sAsK2zxWZ1qn9jdrm4CM/nhg4u2GuEkgxAKy1TX
         6xat6iCh1SVQh/msZNRI0fSt8NhbBSjULuXbCHYN7pDJqHZjX4QVqBle7G5wqEhsMRAi
         nVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766505514; x=1767110314;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jiVMsPmbQP7FZ38DNLit/HG1+5z9nnDnXvMaFIBjNjQ=;
        b=Gk/hNDjl6aUiDhq8SAv19YP9UMu1tc68mpTE63luFGx5ulquXAlSf05zvvxg2Wm1Zd
         GHgufz7y7Cl4n0rx+NSpC/z3CCdpe3+6L0DmcvhJkBDZze/bUkzbV+ueTI7LuFPKNcA/
         UOsQCUPPyxWTmZSWrGNf+BGlQkPIwCCduwuhCq8cFH3LVp2l6SaUGse9VbWsEMGVa8TK
         QrYX/96Or+TqKtK8V04PijPHBeHIC58a4Y8JFlm50Namv/JSQfoF14TdqcFbMVB3o1qB
         ZIPMfE3cDp9dCJfN183GhA7YBs204xLQhoBlx0ASrMiXCQH3IVXITSyhAfbRk6hNbIWX
         eSPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuErL1QdI7zQANd+M/7jEeof4HfgNqAyB6YoLOZPP/oHrxCKnLZmXyOgKjGYc0C0Hj2CoxXcGE@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxhw9rbSezSzV1iPqELCClFr/AdowwRDLGJCnr89GWUs0E/mxgD
	3vSjZ9zCrkTNxmsCebeHnilE68sxwLTzQclFUYPGsTx8ItZyq2WHcTNol4CqnKCgN01Z28bJnBd
	2APRYvAAH4cQ7tMNFrW5Tc2PXnEJ88mx9VA71j7eKuC5IB+iJvz77ynELOXIgzg==
X-Gm-Gg: AY/fxX5Ixe6N6jO26buloQ68EMMzfyCZYY5IB/GbU06emx3LMsLO03U839ghvhdvyMo
	+U36tskp8xyRga6ZNIzGO2RN79oSsIbJFWQUrJu13CLjXTXZCKsjqeUHWFrj9VQEQHb+z0UnpD7
	6Hk9SGq/WKfL7Yk5TF0TsKsQDUqkmiKJJb2XzDymfpcNJWSnLpYBfhB/MgfgwPSSs6JyAIvIjS2
	VYKROC8X5wfd4D2a4RXPHL9wbZ68+PPy4j7V/cbSNoHHewhAfBoSvAQpYtgNm0u1Lm7IeYDkTcb
	NXHiOCjcmr2f7iLQXzjEErBahlL7BAOjzE7XUqz6+Ax+kjdEwJY3yFZ+iBlquzG31kVCK2ZSb99
	uAhW6XpdPTw==
X-Received: by 2002:a17:902:d584:b0:29e:9c82:a91e with SMTP id d9443c01a7336-2a2f21fc506mr163295565ad.7.1766505514310;
        Tue, 23 Dec 2025 07:58:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhayM1D+7Y1gHqun6N5dRaivrEs0mEAHPs1q25xLW/IAzFnLc7m+vKUO2bdvStmAZD+ZHRIQ==
X-Received: by 2002:a17:902:d584:b0:29e:9c82:a91e with SMTP id d9443c01a7336-2a2f21fc506mr163295255ad.7.1766505513842;
        Tue, 23 Dec 2025 07:58:33 -0800 (PST)
Received: from [192.168.1.102] ([120.56.200.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d7754asm131271795ad.100.2025.12.23.07.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:58:33 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jacky Chou <jacky_chou@aspeedtech.com>
Cc: linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org
In-Reply-To: <20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com>
References: <20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com>
Subject: Re: (subset) [PATCH v7 0/7] Add ASPEED PCIe Root Complex support
Message-Id: <176650550798.2188958.10356654881464455126.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 21:28:27 +0530
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: nW_MrcNWWvykbWGqX1IeVypBCFcBhzR5
X-Proofpoint-ORIG-GUID: nW_MrcNWWvykbWGqX1IeVypBCFcBhzR5
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694abc2b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=31AEnvkI3DvSdtIumApubw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=oUgZFhhkZxxgqap4hUAA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEzMiBTYWx0ZWRfX/TkvjE3EJ9u1
 mif/tKPZzjN/67ADe2ztn0A76BBjzjsqfD2EtliKWuN4hIXykNO9uFvc+pLH82QaF4CVmFy8ncT
 0+uMY4dpUZmu0YJly+KY49vE4MsGNZHjuNyfrWpZ+9bk8eiFle+RPWZe3BalUfWgvndD++EmglN
 qg6SEXqGyLOX/yUp2GBkco2ev5z4TgyvtFvp03X5v/xVR/8FK3lYTv7UkKEi9kkrDNsRzzNTsvx
 aJEAs1zAUv66JZgcnoHtJhV9lIKcYnaxTsYlcyvbj9WTKgxH7kT1myDnzPNtf34ipJ9Zv8WtyPr
 odEr+wP+pgYwixylY/jfRGcJfA2d/X1RZZtceAixw+7t5NHQf/1mC6PEtBvolzttc8HOEDLKv2l
 n8S+rorfx4MNfHwJPyIhnLB023Ycl4BSlYpl1fHhRKwnvwdZAVSKEoRg3+vQ4R6bUMckEuVU1GH
 0U1lL9105FARwkQao1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230132
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Tue, 16 Dec 2025 09:49:59 +0800, Jacky Chou wrote:
> This patch series adds support for the ASPEED PCIe Root Complex,
> including device tree bindings, pinctrl support, and the PCIe host controller
> driver. The patches introduce the necessary device tree nodes, pinmux groups,
> and driver implementation to enable PCIe functionality on ASPEED platforms.
> Currently, the ASPEED PCIe Root Complex only supports a single port.
> 
> Summary of changes:
> - Add device tree binding documents for ASPEED PCIe PHY and PCIe RC
> - Update MAINTAINERS for new bindings and driver
> - Implement ASPEED PCIe PHY driver
> - Implement ASPEED PCIe Root Complex host controller driver
> 
> [...]

Applied, thanks!

[2/7] dt-bindings: PCI: Add ASPEED PCIe RC support
      commit: a20df1a7683d6c1416c0f56fb737554b9abe9959
[5/7] PCI: Add FMT, TYPE and CPL status definition for TLP header
      commit: 73ce5ba701a53ad89c623a641401288844f526ac
[6/7] PCI: aspeed: Add ASPEED PCIe RC driver
      commit: 9aa0cb68fcc16280c8c8bdd22dc770af8dd7349f
[7/7] MAINTAINERS: Add ASPEED PCIe RC driver
      commit: e5c2061442dda716fb08cc4eff485220c94e6475

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


