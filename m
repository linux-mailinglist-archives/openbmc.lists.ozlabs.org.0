Return-Path: <openbmc+bounces-1382-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8rnsIUaek2lB7AEAu9opvQ
	(envelope-from <openbmc+bounces-1382-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Mon, 16 Feb 2026 23:46:30 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4B4147F50
	for <lists+openbmc@lfdr.de>; Mon, 16 Feb 2026 23:46:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFHv3640Kz2xm3;
	Tue, 17 Feb 2026 09:46:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771232321;
	cv=none; b=LfGrod20MY2Cc9MKZ+9EHsX/FNBlzguyI7XeceDbnBO340gHVLGkYT4DqTWlFuc3NR30POtoUfWTCjshBG7fgcPwQ4NyoUItUvt7Rnxe375kv4nMyiZ1guZCX1Si8oueZ0zEEtgRfM/X751qWtAHUnJJJxuNXx6DKphG7uKW7L+ccwIBCoZoJhI0mhdkHGwUvfkCyR5EMPQy20BeQJMgOZ7WYuFTfsEp3kaXCTYIQ7Klr5wUXkZPCZoSXIpSrNh5Mq+lwxgCbTZJI3q8ObGBAfOkK9ikKoy1iN3To+1T/5UNdIj7OEgy/402Rk45GQSGiDp65DNFvi4w2TxKChw9lw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771232321; c=relaxed/relaxed;
	bh=9mdP1sEEv3DicMUKY7bSjSANFfPYJzLjnK0jreJ9ZYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ApU2Z9YBR+Ln2KOWt/NHOBEIPRjh4FWHwZPI/oVqugGyF2RCegQy5vfNfcGftX1y32mT1PojyUDVu9qSNq3N5+DJlaydgsLXpFBnh//dgjgPGQPWT+ObNSn4VPw+S2yUyzY+j1NuWHM3eqhVFuWQMDU2YPlVnEMfLuDiYYVXgF+Blg0Gerft2dTwMoIEsE1Jm6ijdRSlmtbY5qoTbybA+5ZQRxc4RkDqVUk1EsoF8iAnRKQxZco1xwq2j7KXjbeXNUUY9Bd6G9qumKIXSq3meU750f1OzVZ1Jclat1YX3zbAHxhayoIRjnpK1qdTWAkRyWTEwMCKLkQfidrpjAaxBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pI0PCEaq; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CWQd+m7f; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pI0PCEaq;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CWQd+m7f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fDxX01JzMz2xN4
	for <openbmc@lists.ozlabs.org>; Mon, 16 Feb 2026 19:58:37 +1100 (AEDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G1iD9V2108540
	for <openbmc@lists.ozlabs.org>; Mon, 16 Feb 2026 08:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9mdP1sEEv3DicMUKY7bSjSANFfPYJzLjnK0
	jreJ9ZYc=; b=pI0PCEaq6yuacdESyQI3Xxu5yUgIKlr1pbhByXdK2cpGfdymriL
	1upMcvYNJS8w/ZU/kA0Sz3oQHDbeIjMiv8hfpmVH8ETEhzjR9wxqaFQDGsSR8HyQ
	Y1jvlPveJNCi7oxAqLaHgPad1jtQOf1gfImtjH0jWjwtpzEYbDfTny4UgvexHfS+
	BJ3IEwr3kSI/Mw9czgw9ErBy8WEyFaB9ZY7tsb67991r/y/9O+SUBIeFvgZfaOhe
	HWyvtXdNq2GPHLoiHsbP0joOIjYwFWTahPoMazEu6GAr8IWYA4YpqqxVHV7sKPTc
	53MeTb8NImYTGI5oF/w53QdnGGZvTZZqfZg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbnv9h2us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Mon, 16 Feb 2026 08:58:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb390a0c4eso2591798785a.1
        for <openbmc@lists.ozlabs.org>; Mon, 16 Feb 2026 00:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771232310; x=1771837110; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9mdP1sEEv3DicMUKY7bSjSANFfPYJzLjnK0jreJ9ZYc=;
        b=CWQd+m7fX/NPUbJYAs3eD7DZCHRmbJ20bvlg76wBL19F5fu8stIFiZi4WE6UTTeNfK
         ET25p433d/RY3x00GUYm+okEC7gO6NolFJtPRM3JhnoQDbhyhzgpxtp9X8gjx0CytGRP
         rk1RMwlTgGXotiSii0cpi0yxBYasskspNoQayTs/MmsyPmafJhJpmSyTjb7LsxCt7iub
         TYvoZDMuLqpdcBPVVTGJT+Tj1RSdoi3FUtTrZ3PsOu9Bvg2jX+33XaWMmDrXr8IuBAuD
         /B5uvuM+2Bfs8kpLs1iFe1h4n85bqyIHEbjD/6PQJkYzgyW5d3h7sduNhSzX4LgOifhD
         wNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771232310; x=1771837110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mdP1sEEv3DicMUKY7bSjSANFfPYJzLjnK0jreJ9ZYc=;
        b=iexBazaDQK7l/bbk9Pp6yeQJB8BqBVPTd1bR6OcPYTy5uK7EaD679whqlkxeac225a
         ES+g9DYkN8N/UEaPANJFhsUkKxnQKJogU+BLcCxNahFJo7Nf6D6k8WFvP00cAlGj7LP2
         UKPbn+wq8iV5lw0v+qsBbRL66iwmW8U4PUw7mao1pKou+OxSEFBJ1NtKaKIsoiZvU0vy
         Fn5zCTnAF8eonr26MLeLjVmD9HZU6VCCkFIRorvm/gNNC/m8B0yVpyEEkReofB2HUO5x
         wqxKkx+PnzsHsSejEd84t+VG8/bPa+SxUmIXbcx2Asex3EU5Q1DJ9ugn6J3/TPPxFQsQ
         aERQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCe4RmISCWoLO/5rrGGz48+y2RExklWBir/GjJ/L0i7AQE/sDJh88sYakRKTcgsJ0UhkYMFPa4@lists.ozlabs.org
X-Gm-Message-State: AOJu0YydvgcwIYwxlxJmU8f40M1Y3korFsaoC1L2nZmQwDWQvMsf1o9I
	cxetxwwz8QzPRxjEdqfmDukqZIG5sEFI5B5VeY5qBfC1s4fQXQSubGRpzVzJaDkRY6m1Y2jRaE1
	JM8Y5A6gvA/+cvGDqA4tHEfw0gqOwq7ffiSOg+DziZYZthMlc2cbmu6+pzifCfA==
X-Gm-Gg: AZuq6aL5CtwWfB8IsDtIaHQn6ZAdGc8yci6IQdzhNTA+/2RIT2ANpsnWijhXfKtEqs3
	hBKB9PM7Ufg33bRFa8eEJMt0Ytz3tYz7hktqHCPvUEz1yMOEi/0j5CBCnCStYUntVqZIU//aIvb
	0uZbIVcUzP6Yyt7S0n5H+LR7/W1GqqSldbHMRlrJy6efaHBcAUn5TLxr9kaqbcyyqLUX8+/ce9L
	b0LJq0d0Qouh28Vzyy0mxVrFdSrBw6YLeb0qOWkELm1VHvjOfAeovWI1A2yD975QuVoSellnHrc
	lqTqeyAvYWQRyGQfNIfw/S3XIo3f9ZMNR5X3NmRv69pbgDYE0jUZDbcLHXWpairp9Am3oguvvGi
	c1Bx6MthpRDFCBVL6fMA2mGGPNIQTy0zgxN7Y8w==
X-Received: by 2002:a05:620a:4487:b0:89f:8bb8:c103 with SMTP id af79cd13be357-8cb4bff2bd4mr845019285a.49.1771232310060;
        Mon, 16 Feb 2026 00:58:30 -0800 (PST)
X-Received: by 2002:a05:620a:4487:b0:89f:8bb8:c103 with SMTP id af79cd13be357-8cb4bff2bd4mr845017585a.49.1771232309653;
        Mon, 16 Feb 2026 00:58:29 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dcfafcdsm644400165e9.9.2026.02.16.00.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 00:58:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Andi Shyti <andi.shyti@kernel.org>, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] i2c: npcm7xx: Use NULL instead of 0 for pointer
Date: Mon, 16 Feb 2026 09:58:26 +0100
Message-ID: <20260216085825.70568-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=929; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=SpvqgitAm5DBJSVPgUSEucLUHNRZc2U0J5AJUKtXN0Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpktwxbeX3OO3EWdHHHK0tcuimC80VWGXUHBWb/
 TcNUsr+0x2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZLcMQAKCRDBN2bmhouD
 10wDD/9aOai/6YTX7krBZ4deU7lzy8oIaMnkFJiPfNFcD74mDJvAb0xMBxiT2xykteztHQHyhlJ
 7QBZsq/F9vhzh+jHHsqi+NNRxY7BRukmUW+Yy865W9sNxQEusH8cY71MR9xm79eMjX31apL4tUT
 k9bYQkU3DFOhiAmdh4VnH8qtecqeD/DKXVNPOlzTTs+CmPuRJA3tzpezwJw8W/HVavRfJ0+o7sa
 OqSiNS1oj8KCAzsyxEyPJ1ld+cwXTrBsyWvcqj9EpTpQJRrd0H232k4MxOC1kUFZ0R3PgM3NfMO
 m2i1nPEDdMA+Z6De7noJ1wg+GpjWHnefY7T2rfXNAqXqEGxk4VpEUZD3GfFiaynXOeYqAJq/YDl
 Iu89ub+d1xndMbS/oZSZ3YR/DdETPeZEC7lU7bsD/D5ZMyGesyP/Gda1gqai9ibOfPtzgRliYzK
 zzGc+OmBiXyZS5FEGCjMDuRarDrwYVfBOPo4PW6AVVCyPJtctGYWeKmjzDO6KX1QsEaTLrmWRq0
 i6tWHraMtGcSKqQWMAMvnEQUaQaQAkTrbZrF5MzNdwpbqbMmrUBwtG/DMRgn7wdHKHYoFgaVs2z
 0ILT24WuIHzzqc2Q9Asq3Gv86Nb250UKTWZmyDbNs2kUJzAPnMsDJd3VI4yYpw7xLc0bnMVblhi s8cR3vbkqSfmVaA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: epz2uWD7C_LbDNUVqEQtUsff2bwTmlPT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA3NCBTYWx0ZWRfX2YvlCfEC0Im5
 6auW9QU9LqXifuwaFP5QBJO7fIOwl99FnuPiYD0/NmE43ZDhZci1JjjVNDDlbunGxH3uEBfwLP5
 I4SwwyVriMZmixNUNHLHT+Yslr9QoXDRtEIbquiV6NLpSA6aRXQfhHj4EdqZYvZ7jQla0JLs8ir
 Y/aZnAzFwrmhVKWVAYKV1HfoRApWmfBRDjBczsk3RDnyrhL5FztAEga2aB1CQxp2u2s7Teic7qT
 /0Ylwb3gpoyFjzKsbiZzaLLh/nbxbyLzYiO/C3wSrObdJQpDyak0y4/UtD960JxO+KJ9QbIO44o
 ROKoigSO29xL7/TS9ZDm06nd8Gtc9KZ3mPz4IJfFZKMZf6255KFke7EsAsiLYKSUJ7bez196QU+
 sfFF6Rclbd+EpgGyoqtsoOdcwDMAUW2DZQtPEsKph8EJ58NpfMY7271dO4o4YZbmpC7gOtisjkt
 YgGrx2eBABZyx2Xeg9w==
X-Authority-Analysis: v=2.4 cv=b7K/I9Gx c=1 sm=1 tr=0 ts=6992dc36 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=pz2CoIr9GbPYS4DEQB0A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: epz2uWD7C_LbDNUVqEQtUsff2bwTmlPT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160074
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.80 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:andi.shyti@kernel.org,m:openbmc@lists.ozlabs.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:taliperry1@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-1382-lists,openbmc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,openbmc@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[codeconstruct.com.au,gmail.com,google.com,kernel.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[openbmc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 8A4B4147F50
X-Rspamd-Action: no action

Pointers should use NULL instead of explicit '0', as pointed out by
sparse:

  i2c-npcm7xx.c:1387:61: warning: Using plain integer as NULL pointer

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 8b7e15240fb0..f667a873b81e 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1384,7 +1384,7 @@ static irqreturn_t npcm_i2c_int_slave_handler(struct npcm_i2c *bus)
 		 */
 		bus->operation = I2C_NO_OPER;
 		bus->own_slave_addr = 0xFF;
-		i2c_slave_event(bus->slave, I2C_SLAVE_STOP, 0);
+		i2c_slave_event(bus->slave, I2C_SLAVE_STOP, NULL);
 		iowrite8(NPCM_I2CST_SLVSTP, bus->reg + NPCM_I2CST);
 		if (bus->fifo_use) {
 			npcm_i2c_clear_fifo_int(bus);
-- 
2.51.0


