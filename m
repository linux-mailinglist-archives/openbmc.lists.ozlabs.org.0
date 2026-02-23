Return-Path: <openbmc+bounces-1406-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uC55GIndnGl/LwQAu9opvQ
	(envelope-from <openbmc+bounces-1406-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 24 Feb 2026 00:06:49 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3F517ECF0
	for <lists+openbmc@lfdr.de>; Tue, 24 Feb 2026 00:06:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKc1K3Lczz3cB0;
	Tue, 24 Feb 2026 10:06:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771840119;
	cv=none; b=jPUFl2fKPdWtvsJ/NWmLLLGp3LUfA2wYDaafNzefFF3UtfrSGZGZgAAD10YQBFNwsg1jXeAGxjbpDRnPvfsyI4CHyJ0wE4F4J23Zb4lXxa2gTS/QovndYJNqpa4KUBy6TzgFjOxVp3XituW9meI6sxL/izgmuHykMeSP8wSr9kK9yc0T+dYgB/J+Bw9EekGqbQ8qONV4Z5NGNpuMtlYFa5EeeW542tAY2eQi+49heOJDsA40ihzBZLhfQgudluk+3XhHooRQEmz2urnwIZhDoQrsRhcc481Sn/iJNAiMaWxTONlrHlhYtdSqCnTCyMMpRtBvZzYmUBTyZcDcrbULUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771840119; c=relaxed/relaxed;
	bh=5iEM8cMdtJNGkyfS6uG+d6iaU5XdbvHNbxCiohXcTZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RzVu7Tn23L8O2rD9JwptBi5jXOMGrKVrl+LZeW5RP7VTGbU7b4G9w+yIuC+q8aDdpBZ9nCnthvDRL3h7pkihgcQjRBc8YNILS6T0H06hJlZUUi9wLkA5JU2kyJqQ0YkiuyfTKh1xhiKy1rFAhAVtq/NwD8YeLTpWEgFnhaY1OW3td0bO6F1LpW9ONRTYRFjZPYqzrElmdUFYmr0c5j65K7rg0Kq21o8ltBGN7urdFKmnfSO9+Lc7r9Lx8yhXcNnkIKVzOFcpNO6Ga3B4yzfoIwGCL+JDejrsCTy7Z0EhfGZOZBeuqb8dFR+3f7BQBwvmF4qwe8tLODj4m5FpzvG8IA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OroHNi22; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FbjWIX64; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OroHNi22;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FbjWIX64;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKGJQ0SHQz2yDk
	for <openbmc@lists.ozlabs.org>; Mon, 23 Feb 2026 20:48:37 +1100 (AEDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N00DqN3424203
	for <openbmc@lists.ozlabs.org>; Mon, 23 Feb 2026 09:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5iEM8cMdtJNGkyfS6uG+d6iaU5XdbvHNbxCiohXcTZI=; b=OroHNi22lccLAVQK
	nJZ2qGAu+APmq7aHe+SfJiBUPhHzXwPFKzGBYBjtqbvLsiR38MQTWBtLfDdwiXPW
	YXbMDHumwqPvtvy9YUJTgusdcpnFDlR/tT2DuxGrQfb5Fl/aHYpoYk/0pueXMqe5
	HPPOhogDrj0AzoSRw9dFD4s5CDSs5V0wg3S8gwSWP5hHIJm8nVO6hrwPpyqxfuGD
	Vmss0gofubgX7joXjX1kxO6wJVRZg2jpmqoB9KvpD+/RUUlQ40Il3vo5tSUNqR61
	w6n5GTa52A8kVjgIfcfG1xiORjje5OiIu3J6bM9s1s60lrzKOlkaR9lgI8TRN/u4
	RfPUaA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wk463j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Mon, 23 Feb 2026 09:48:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c881d0c617so3960046285a.1
        for <openbmc@lists.ozlabs.org>; Mon, 23 Feb 2026 01:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771840114; x=1772444914; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5iEM8cMdtJNGkyfS6uG+d6iaU5XdbvHNbxCiohXcTZI=;
        b=FbjWIX64GabXjiRsRaW9h1uIiGOkS0Xx+XlvLU0IR+mCOPmkPXADjc1Ziz+I98Wnpw
         oe7Ks6NPGWCPW9OikednmwMHnMRi5uDQZ4uYTXpPrcqSMTdLryFoHBRMU55EsASAsOq6
         ylfESFujS/kceaXyXivybXvDP0eelswfOPRgAzMHCLZYtMk5vmNRewQAHSE3C245oFoE
         It+NU+EovZpCpTYkg67bcadQRyu9jPiHQgFyM+ajfhCoOX1I/1NMMYnNgswEcOCwflTn
         ueV1T4g8SsSRn+9uTsygz6T7US6IMCNxe4MyWXyzcWkqhBaKmhoGESmQTjusxBtuMn+z
         5Kbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771840114; x=1772444914;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iEM8cMdtJNGkyfS6uG+d6iaU5XdbvHNbxCiohXcTZI=;
        b=pzh7fwflE5gW7yom/i496w0qAHsgoZisIJPZin744sSkYvaBF3I975dGH/NFBcch8w
         Zos+k1Ja69rxvPknOGYkcr8vUiCWHiGr8XLA7d05RyAqxV//okRBFT5ZFNAlM3YqJLYD
         DiSEGQk27I/CPuUPnF/tGGq2b1MZZWg4x/HRr0arUIFuwCFutx7dhVPu/YkduMYoNEGd
         iwTVbjMXgTg7WhrluR31a6dVRBno7U8Lkx6pFBp6nCEdkLwwCSdrMWFaNQYxqoR7inNd
         iDDdaTWUG4wguEbVCZWfaYje+eG1D/oWTt7DqjimJsBBv3Wi4PZ90SsiFzZ+1YcYdsQp
         LiTw==
X-Forwarded-Encrypted: i=1; AJvYcCW+2Nq9xahNuCiKjYZ9V0TsQqfufMUCSONRiejhEN3SLaqwu5ilvzTz7+Te2qJEhFPmvswz/1Tf@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxoZBlgs2MVgXHSEiEK88m6CHMGhgTsKMLrxq/yzvabTDVrogtT
	QYlbpZruEDrSfDSZ40FjCG1L6CcU+ip0ZC5RF1AxnEj8XxiHwCxpTGTFzH1dmEYsBDtMMxoAqO3
	agFTtl+GqojG7NdssQ7zMhScoj98fW0Xv55+l3RPYdVXHdNcGuJtHd/k6UH6BMQ==
X-Gm-Gg: AZuq6aL7Lu2jAfT1tPzjvZF+PeUji+O3ZqhkY0qy2Jg4jGfPTaqMHeBlTtBlhd5jnIw
	I188Hlnl1r+X8UV4vWITclsSvyGdiryxTmP5pQKwKS+pfnW2GyMlw3pxPTSYVwmHEFQS3ahDQaU
	kKLqZdpRQrp1i/8XWbdnhysh24gXSSdcftrqRwf7hBrmSyUGwYBGuourjmdg5I1ujDpSL7P5cIP
	NeINo/yOf4CAVI7cLzm8GHq6rIMMRxTHJRybqLVXDvYURN6XchtNBvLohwWaRXnl38f589fzGSg
	s0i68uGGPs+Wb8gXNJWipFwcskHb6ipXAsGeOw8wmdC5IHcCvy0hsXRqfZ8rZwVFAjEM0tEs9j4
	Ed6dXp2uxGOD73BFP+V51lpQ//kNrwhkH7oUNOiCVkHN0sq2T2w==
X-Received: by 2002:a05:620a:294f:b0:8cb:54d6:7ba with SMTP id af79cd13be357-8cb8c9d1e69mr946021485a.7.1771840114336;
        Mon, 23 Feb 2026 01:48:34 -0800 (PST)
X-Received: by 2002:a05:620a:294f:b0:8cb:54d6:7ba with SMTP id af79cd13be357-8cb8c9d1e69mr946019285a.7.1771840113787;
        Mon, 23 Feb 2026 01:48:33 -0800 (PST)
Received: from [192.168.1.29] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9b668f3sm186879935e9.3.2026.02.23.01.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 01:48:33 -0800 (PST)
Message-ID: <63d4562c-13b0-4f91-b15c-a1ec03799842@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:48:30 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] pinctrl: rockchip: Simplify locking with
 scoped_guard()
To: David Lechner <dlechner@baylibre.com>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng
 <hal.feng@starfivetech.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
 <20260118-pinctrl-cleanup-guard-v2-10-bd36f681bdc0@oss.qualcomm.com>
 <f5b38942-a584-4e78-a893-de4a219070b2@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <f5b38942-a584-4e78-a893-de4a219070b2@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=699c2273 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Lrcc1p6bT1NFpwlYX9oA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NCBTYWx0ZWRfX1r5YcwgDM7wI
 4tgiDoPmIpeRef2jaJekNvx8wY8ARLrwW/S6ckFIqAmf3IXJWLTb2Bp0cF3HF67h1bJzPVKf9xL
 QsXSPQbyPT0WUCpSuk3+m4MXcpIJI/oMVLmDrM4YX/zSnDA9jXhLF7CSe83tKalA3C+kNtfcNeb
 ecyuznL+btguF5JJI0G1l9i9Tbx2W9qiNpDhCOkFf9/zYCXkVUURoD9rxGxIpORHqdkG4k7UlDi
 cQiUdMACJ0pqO4u5p6bXazoLK2CTkTdh4bZ6F2sF16uq2QFQ+R4xkF+xQQv6ZebFaQZez48lotB
 vehtD/IUoL/bZ1hTwMVHQxkexMjT6w8cn5nJ9rgNls0NKsqnzL0k2Yh2e1GvWHd7MS81kR3Lt/3
 NJt2Xlm8c9lFCMoVmoGM94FeU24cdw0vIdC88a4WirotA2npugDFBibhjZbcntmS4U1QRnVLDbj
 fUdJ0HZ5gOtQT/d3ICA==
X-Proofpoint-ORIG-GUID: ce9Gvskn1HEsAsnWhhIDyDwm9zEq7Iw6
X-Proofpoint-GUID: ce9Gvskn1HEsAsnWhhIDyDwm9zEq7Iw6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230084
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.70 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1406-lists,openbmc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dlechner@baylibre.com,m:andrew@codeconstruct.com.au,m:linusw@kernel.org,m:joel@jms.id.au,m:kernel@esmil.dk,m:hal.feng@starfivetech.com,m:unicorn_wang@outlook.com,m:inochiama@gmail.com,m:Basavaraj.Natikar@amd.com,m:Shyam-sundar.S-k@amd.com,m:brgl@kernel.org,m:Steen.Hegelund@microchip.com,m:daniel.machon@microchip.com,m:UNGLinuxDriver@microchip.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:heiko@sntech.de,m:patrice.chotard@foss.st.com,m:linux-aspeed@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:sophgo@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_TO(0.00)[baylibre.com,codeconstruct.com.au,kernel.org,jms.id.au,esmil.dk,starfivetech.com,outlook.com,gmail.com,amd.com,microchip.com,nvidia.com,sntech.de,foss.st.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 7A3F517ECF0
X-Rspamd-Action: no action

On 23/02/2026 01:12, David Lechner wrote:
> On 1/18/26 12:09 PM, Krzysztof Kozlowski wrote:
>> Simplify error handling by removing two mutex_unlock() calls with
>> scoped_guard().
>>
>> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>  drivers/pinctrl/pinctrl-rockchip.c | 19 +++++++++----------
>>  1 file changed, 9 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
>> index e44ef262beec..bbe1cf712965 100644
>> --- a/drivers/pinctrl/pinctrl-rockchip.c
>> +++ b/drivers/pinctrl/pinctrl-rockchip.c
>> @@ -3640,17 +3640,16 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
> 
> Filling in some context from the existing code...
> 
> 	for (i = 0; i < num_configs; i++) {
> 		param = pinconf_to_config_param(configs[i]);
> 		arg = pinconf_to_config_argument(configs[i]);
> 
> 		if (param == PIN_CONFIG_LEVEL || param == PIN_CONFIG_INPUT_ENABLE) {
> 			/*
> 			 * Check for gpio driver not being probed yet.
> 
>>  			 * The lock makes sure that either gpio-probe has completed
>>  			 * or the gpio driver hasn't probed yet.
>>  			 */
>> -			mutex_lock(&bank->deferred_lock);
>> -			if (!gpio || !gpio->direction_output) {
>> -				rc = rockchip_pinconf_defer_pin(bank, pin - bank->pin_base, param,
>> -								arg);
>> -				mutex_unlock(&bank->deferred_lock);
>> -				if (rc)
>> -					return rc;
>> -
>> -				break;
>> +			scoped_guard(mutex, &bank->deferred_lock) {
>> +				if (!gpio || !gpio->direction_output) {
>> +					rc = rockchip_pinconf_defer_pin(bank,
>> +									pin - bank->pin_base,
>> +									param, arg);
>> +					if (rc)
>> +						return rc;
>> +					break;
> 
> I think there is an unintentional change here.
> 
> scoped_guard() is implemented by a for loop. So the break statement is now
> breaking out of the scoped_guard() scope rather than breaking out of the
> outer for loop.

Yes, you are right, thanks for catching this. I think the code can be
fixed with "return 0".

I need to check my other patches as well.


Best regards,
Krzysztof

