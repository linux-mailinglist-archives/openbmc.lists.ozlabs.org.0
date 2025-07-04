Return-Path: <openbmc+bounces-311-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDE2AF996F
	for <lists+openbmc@lfdr.de>; Fri,  4 Jul 2025 19:02:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYg1C20wJz30gC;
	Sat,  5 Jul 2025 03:02:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751648559;
	cv=none; b=hyHbd5WsHm0Y9nAXQbHaAmWWJHoyVlvzm+l5kdguKitw/pbhieRUefJpFbv98hYGmUkQAYyTUWR9iM33CwZoFrTvRhLuy6U8ttgyGcWLDpm2qnDWr6KWNO8fefJgsaWOMvFh2pxbg/Rb0hs/YN7sYVYRcuQxk9JvAF0wGs3AgthQmi+udjAYfwMNjJG5N4F/Qi5+JRgAfLMMtK/92Dr72gxqpw9bnCJEsxqR3y0IRGi2Qbi6klf1bIJBwJT2s7OQFvPTpFoLKfT8BuB7hUF3B7BvZh3ALJveq2GF1hD/bETrACTWPPDKzuDnVLceJxLgRCgPGjzT0buoTjo9DYgcPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751648559; c=relaxed/relaxed;
	bh=JtDFqESKjJ8VWxMCcEK1AHalZwkUbuR0foJQEFJaHL8=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:From:Subject; b=IidgKGnSy84ZVBAov4k7kkLCtYxckc+Jue2tlIrP3fKmMmg4RQK8Xd/CQYMmKIOgpoppe4rBKLgNJnFMWNz/jOeRhm3kd1NZ0E+tqpAJOb9LKakm8rlw9FJJJ/M/07fNqidmry1/95eLHTJE/G4Y1udeKpUz00beD564S5ULAghYfvQbQtGInVxzcUeuiAW8wZpEDHXHwnNudl5x+C2ezLbRtxoIDrFPusPO7OH/qfP0zJ6ezLfLemu5RisH4EUThXpCJI83QSfPIbQCcHe1CzeMgPyJaggEfS0Uy/G+kEhm2W6+vcho1Vif++lIitF3XtBMOS2mzL6KWXjcEP7b3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nD1qXTIp; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=graeme.gregory@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nD1qXTIp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=graeme.gregory@oss.qualcomm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 3913 seconds by postgrey-1.37 at boromir; Sat, 05 Jul 2025 03:02:37 AEST
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYg195C3dz30Wn
	for <openbmc@lists.ozlabs.org>; Sat,  5 Jul 2025 03:02:36 +1000 (AEST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564EtPYe000438
	for <openbmc@lists.ozlabs.org>; Fri, 4 Jul 2025 15:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=JtDFqESKjJ8VWxMCcEK1AHalZwkUbuR0foJQEFJaHL8=; b=nD
	1qXTIpNZ9RkG9YmfOidJ985XFQ/Asw3qgWCPCnPHjAkzF85WnXou6xNE3c8OGWmO
	W0wBhCvT1wqLGe40d2l5DmrCLX4cipgk1vmOLKzKd3vHUIoLkg3pbZ4cqJWr5TXD
	X617LnxsAYLYRzDc+W0kqER72PgwY8dsFRQG/T5Ng8drrcaZDf8g11EGg0KdXuTp
	6Eqyi63zlcH0DeCAm56kQNaOJVm4Xq+heqf9GNyOz9rZxwAi5EFudgpG40a9uiRU
	fSmqFBf2MSwxric1dLukkYg4WUtvEHAoKMFBG+QlicZl8209r6FA8hK1qiGrSqc7
	7lDspaRyfUUwB//YGJyQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmm87p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Fri, 04 Jul 2025 15:57:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d5e345a3fcso31101085a.1
        for <openbmc@lists.ozlabs.org>; Fri, 04 Jul 2025 08:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751644640; x=1752249440;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JtDFqESKjJ8VWxMCcEK1AHalZwkUbuR0foJQEFJaHL8=;
        b=IRZiu+VL8zl/XLCW8wHi3TtA0dz0VAnVCh+a7jAzQ9XHBZs6I1gDvbGjwpfEwCTFxn
         QlADrswWZ4rStASnadiHUtg2NbtL5v/qsSjAlv3X7EZVh5jXauQdkal3t4rdbu1LtEWK
         saHf6nkrCkZrGxRcZixAJQeT1RIZZvROK0S/ZEGKgsNFOShhCldiQb5wHjIOA0vI5moq
         B81WBqXVlInn4bjVsAyY5+/wrLc4IKPbbOTm+DnsIL0uabOYuyEa/Ii9CCondfBLEgu1
         aOTO8ugH1TrIylPklXkc5qnzmpcL++UPSa09PZ+xvQLgqPQc1gEPjxOdQaUn/haku5Aw
         Tdcg==
X-Gm-Message-State: AOJu0YxzxXKMDbcWlI3BDW14mg38ccxVT5hjRLUqi5J62jqBRShJOxCF
	M9F6b7GAKfRnYH5o8c8k+4kUHmQGZBpfk/lsCJcX013STbthG63Q35JPfqvu/DDHQmRNyfEFCHN
	TWeWWOTuyfXsM8QESqNEZ1WySvs/XJDUnUKw6TgnUIvMjM4wb9rxsLdt6oi1ruoS6cfL+tw==
X-Gm-Gg: ASbGncsAH9jtn4mL5je2vurrxrnmbzCN1Zs2rUG62K+oM8wWm6b9uawhZKwjcAE6fTg
	jsvxdfp0GJFix/jKsumkwCT8gNo4Wg+nhW74MTO3P8a0u5O9WyboNDba1SvjkIisTipgKKo+X9V
	jrUatFSHNDvdc1n9vGtyVlpc0yRDfSpAPfZNhBLC7EnuFhLU3/CHint2q30uquo9hzn1B897Bgg
	62mCPDBepkziI+ozHahPZQkwwp7gBCIXl7UTFgqsp936ROufGmO6xPIQGVEwLidxUGGQdN4tOyY
	Ln0xVwJ68ZFovhs1b3+KQSnep7r48KJYAH396ei1zDCL4CFDuw6gPRIt
X-Received: by 2002:a05:620a:370f:b0:7d3:ffdb:1772 with SMTP id af79cd13be357-7d5dcd0b21amr418652285a.29.1751644639720;
        Fri, 04 Jul 2025 08:57:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcOMpZXwVZ8Icr3Vv0jYBHwh3aD4wxG5bIZnoS6dTTE/TlhA+NH0+onZjL0bWyAEUTD8vYsw==
X-Received: by 2002:a05:620a:370f:b0:7d3:ffdb:1772 with SMTP id af79cd13be357-7d5dcd0b21amr418646085a.29.1751644638792;
        Fri, 04 Jul 2025 08:57:18 -0700 (PDT)
Received: from [192.168.222.184] ([62.3.69.143])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca78fb4bsm1516308a12.31.2025.07.04.08.57.17
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 08:57:17 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------vqwgTcfJWrSuT0w4CSU7Jkyg"
Message-ID: <f4c1b19d-192f-476b-9a88-ee2b92028e66@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 16:57:16 +0100
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
Content-Language: en-US
To: openbmc@lists.ozlabs.org
From: Graeme Gregory <graeme.gregory@oss.qualcomm.com>
Subject: Qualcomm Schedule A update
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6867f9e1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=SuLcZ9k70mpOreAMLacAVg==:17
 a=Wb1JkmetP80A:10 a=r77TgQKjGQsHNAKrUKIA:9 a=ZIG0eouJeErQ7K6XqlQA:9
 a=QEXdDO2ut3YA:10 a=8X5cWcN6o57i5MZWdVYA:9 a=SCdrX_Qa_uUB6yDr:21
 a=_W_S_7VecoQA:10 a=3ZKOabzyN94A:10 a=zbD-VVv8sh37iXo56rIA:9
 a=n3BslyFRqc0A:10 a=rls1ZAiwvL0A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: WuNY_xmJmiUtT798IHEA7FRI_c1-mPxu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyMSBTYWx0ZWRfX6WdTQ9NnYe2p
 bZWziuhYb3kE0zjuNl2r7LYrbwl8cmaiChpIPR066Wob+oyFHuFzdULjjxMlMAFynlwcmeZbDql
 zXSuRDuVFrMnm849oRCIZ4dS0wSiWv36R3K2nLiLsCQra9x2X+awyXnHIDCkzncG95HsdFmJ2vs
 b74Sdi/dB8GOEoQh3vmcvswiqr/xMKbyvJqPYUPYmscaJ7PWcBS+XBq04iBm+NkbO/DkTbHAoaA
 WYgTy8pWqcxvUcob+by9VL8+gNuqhhB5/WjmIxktKRoOfst4PkNhrtjucTVcTeXTgMhqzeZIwtN
 aVuKqRrBQKbRLMRB63QRTsb9tv4Ea16ff9qMKY6d7Zirdyh9TGuvKK2Ck5+v87gvlx7IKedaSK8
 z1sO2whXYzm7GIh4+a1rjYyGh2Wd6CjDknDq3pFxdDYAEARDGEEjS7e1vRtCzZTofbnGZ8b+
X-Proofpoint-GUID: WuNY_xmJmiUtT798IHEA7FRI_c1-mPxu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040121
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is a multi-part message in MIME format.
--------------vqwgTcfJWrSuT0w4CSU7Jkyg
Content-Type: multipart/alternative;
 boundary="------------8hlV6Ypyw4NayQonl0GTvQby"

--------------8hlV6Ypyw4NayQonl0GTvQby
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

|Please find a Qualcomm Schedule A update attached.|
|Thanks,|
|
|
|Graeme Gregory|


--------------8hlV6Ypyw4NayQonl0GTvQby
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="line number3 index2 alt2" data-bidi-marker="true"
style="margin: 0px; padding: 0px 1em 0px 0em; border-radius: 0px; background: none rgb(255, 255, 255); border: 0px; inset: auto; float: none; height: auto; line-height: 20px; outline: 0px; overflow: visible; position: static; text-align: left; vertical-align: baseline; width: auto; box-sizing: content-box; font-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace; font-weight: 400; font-style: normal; font-size: 14px; min-height: inherit; white-space: nowrap; color: rgb(51, 51, 51); font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code
        class="java plain"
style="font-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace; border-radius: 0px; background: none; border: 0px; inset: auto; float: none; height: auto; line-height: 20px; margin: 0px; outline: 0px; overflow: visible; padding: 0px; position: static; text-align: left; vertical-align: baseline; width: auto; box-sizing: content-box; font-weight: normal; font-style: normal; font-size: 14px; min-height: inherit; color: rgb(0, 0, 0) !important;">Please
        find a Qualcomm Schedule A update attached.</code></div>
    <div class="line number4 index3 alt1" data-bidi-marker="true"
style="margin: 0px; padding: 0px 1em 0px 0em; border-radius: 0px; background: none rgb(255, 255, 255); border: 0px; inset: auto; float: none; height: auto; line-height: 20px; outline: 0px; overflow: visible; position: static; text-align: left; vertical-align: baseline; width: auto; box-sizing: content-box; font-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace; font-weight: 400; font-style: normal; font-size: 14px; min-height: inherit; white-space: nowrap; color: rgb(51, 51, 51); font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"> </div>
    <div class="line number5 index4 alt2" data-bidi-marker="true"
style="margin: 0px; padding: 0px 1em 0px 0em; border-radius: 0px; background: none rgb(255, 255, 255); border: 0px; inset: auto; float: none; height: auto; line-height: 20px; outline: 0px; overflow: visible; position: static; text-align: left; vertical-align: baseline; width: auto; box-sizing: content-box; font-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace; font-weight: 400; font-style: normal; font-size: 14px; min-height: inherit; white-space: nowrap; color: rgb(51, 51, 51); font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code
        class="java plain"
style="font-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace; border-radius: 0px; background: none; border: 0px; inset: auto; float: none; height: auto; line-height: 20px; margin: 0px; outline: 0px; overflow: visible; padding: 0px; position: static; text-align: left; vertical-align: baseline; width: auto; box-sizing: content-box; font-weight: normal; font-style: normal; font-size: 14px; min-height: inherit; color: rgb(0, 0, 0) !important;">Thanks,</code></div>
    <div class="line number5 index4 alt2" data-bidi-marker="true"
style="margin: 0px; padding: 0px 1em 0px 0em; border-radius: 0px; background: none rgb(255, 255, 255); border: 0px; inset: auto; float: none; height: auto; line-height: 20px; outline: 0px; overflow: visible; position: static; text-align: left; vertical-align: baseline; width: auto; box-sizing: content-box; font-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace; font-weight: 400; font-style: normal; font-size: 14px; min-height: inherit; white-space: nowrap; color: rgb(51, 51, 51); font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code
        class="java plain"
style="font-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace; border-radius: 0px; background: none; border: 0px; inset: auto; float: none; height: auto; line-height: 20px; margin: 0px; outline: 0px; overflow: visible; padding: 0px; position: static; text-align: left; vertical-align: baseline; width: auto; box-sizing: content-box; font-weight: normal; font-style: normal; font-size: 14px; min-height: inherit; color: rgb(0, 0, 0) !important;"><br>
      </code></div>
    <div class="line number5 index4 alt2" data-bidi-marker="true"
style="margin: 0px; padding: 0px 1em 0px 0em; border-radius: 0px; background: none rgb(255, 255, 255); border: 0px; inset: auto; float: none; height: auto; line-height: 20px; outline: 0px; overflow: visible; position: static; text-align: left; vertical-align: baseline; width: auto; box-sizing: content-box; font-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace; font-weight: 400; font-style: normal; font-size: 14px; min-height: inherit; white-space: nowrap; color: rgb(51, 51, 51); font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><code
        class="java plain"
style="font-family: Consolas, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace; border-radius: 0px; background: none; border: 0px; inset: auto; float: none; height: auto; line-height: 20px; margin: 0px; outline: 0px; overflow: visible; padding: 0px; position: static; text-align: left; vertical-align: baseline; width: auto; box-sizing: content-box; font-weight: normal; font-style: normal; font-size: 14px; min-height: inherit; color: rgb(0, 0, 0) !important;">Graeme
        Gregory</code></div>
    <p><br>
    </p>
  </body>
</html>

--------------8hlV6Ypyw4NayQonl0GTvQby--
--------------vqwgTcfJWrSuT0w4CSU7Jkyg
Content-Type: application/pdf; name="Qualcomm Schedule A Update
 2025-07-04.pdf"
Content-Disposition: attachment; filename="Qualcomm Schedule A Update
 2025-07-04.pdf"
Content-Transfer-Encoding: base64

JVBERi0xLjQKJcfsj6IKJSVJbnZvY2F0aW9uOiBwYXRoL2dzIC1QLSAtZFNBRkVSIC1kQ29t
cGF0aWJpbGl0eUxldmVsPTEuNCAtcSAtUC0gLWROT1BBVVNFIC1kQkFUQ0ggLXNERVZJQ0U9
cGRmd3JpdGUgLXNzdGRvdXQ9PyAtc091dHB1dEZpbGU9PyAtUC0gLWRTQUZFUiAtZENvbXBh
dGliaWxpdHlMZXZlbD0xLjQgLQo1IDAgb2JqCjw8L0xlbmd0aCA2IDAgUi9GaWx0ZXIgL0Zs
YXRlRGVjb2RlPj4Kc3RyZWFtCnicbY9PT8MwDMXv+RRPu7AdGCs7THBbJzRAA/GnF45e67ZB
abylKVA+PUk3ARLIB8f28/Mve8ymCWYxjjlv1AyV2qtk6OKY8gZpps6eFrGRleogTnA+x+Ji
jqxR4+e85qIzjOUke1VJgmyjxpicqPGN1V6TgdGth5QouNWVJc8FuNkZ6ZnbKe7TS1Dna3H6
k7wWC93CiofXQegFO3Je550hN7iuxHqnt12UhvUHw9QytC10HqwxWm2WuCNLFbsRLH/46OFr
hqWGIwbZ/uf+ABfuROctG3kPUvIgx99QBwoqCoiD40be+N+voHTShHV9MA1Iw9noXHa+czyN
z6FOHRVIdVvLDqf4RRyHa0ccSNeOK3H93/ktMa77zuJFJNRXmXoM8QX3Yo+hZW5kc3RyZWFt
CmVuZG9iago2IDAgb2JqCjI5NgplbmRvYmoKNCAwIG9iago8PC9UeXBlL1BhZ2UvTWVkaWFC
b3ggWzAgMCA1OTUgODQyXQovUm90YXRlIDAvUGFyZW50IDMgMCBSCi9SZXNvdXJjZXM8PC9Q
cm9jU2V0Wy9QREYgL1RleHRdCi9Gb250IDkgMCBSCj4+Ci9Db250ZW50cyA1IDAgUgo+Pgpl
bmRvYmoKMyAwIG9iago8PCAvVHlwZSAvUGFnZXMgL0tpZHMgWwo0IDAgUgpdIC9Db3VudCAx
Cj4+CmVuZG9iagoxIDAgb2JqCjw8L1R5cGUgL0NhdGFsb2cgL1BhZ2VzIDMgMCBSCi9NZXRh
ZGF0YSAxMSAwIFIKPj4KZW5kb2JqCjkgMCBvYmoKPDwvUjcKNyAwIFI+PgplbmRvYmoKNyAw
IG9iago8PC9CYXNlRm9udC9FU09EQlgrQ291cmllci9Gb250RGVzY3JpcHRvciA4IDAgUi9U
eXBlL0ZvbnQKL0ZpcnN0Q2hhciAzMi9MYXN0Q2hhciAxMjIvV2lkdGhzWwo2MDAgMCA2MDAg
MCAwIDAgMCAwIDAgMCAwIDAgMCA2MDAgNjAwIDAKMCAwIDAgMCAwIDAgMCAwIDAgMCA2MDAg
MCAwIDAgMCAwCjAgNjAwIDYwMCA2MDAgMCAwIDAgNjAwIDYwMCA2MDAgNjAwIDAgNjAwIDYw
MCA2MDAgMAo2MDAgMCAwIDYwMCAwIDAgMCAwIDAgNjAwIDAgMCAwIDAgMCAwCjAgNjAwIDYw
MCA2MDAgNjAwIDYwMCA2MDAgNjAwIDYwMCA2MDAgMCAwIDYwMCA2MDAgNjAwIDYwMAo2MDAg
MCA2MDAgNjAwIDYwMCA2MDAgNjAwIDYwMCA2MDAgNjAwIDYwMF0KL0VuY29kaW5nL1dpbkFu
c2lFbmNvZGluZy9TdWJ0eXBlL1R5cGUxPj4KZW5kb2JqCjggMCBvYmoKPDwvVHlwZS9Gb250
RGVzY3JpcHRvci9Gb250TmFtZS9FU09EQlgrQ291cmllci9Gb250QkJveFswIC0xODcgNTk5
IDYyMl0vRmxhZ3MgMzUKL0FzY2VudCA2MjIKL0NhcEhlaWdodCA1NzUKL0Rlc2NlbnQgLTE4
NwovSXRhbGljQW5nbGUgMAovU3RlbVYgMTU5Ci9BdmdXaWR0aCA2MDAKL01heFdpZHRoIDYw
MAovTWlzc2luZ1dpZHRoIDYwMAovWEhlaWdodCA0MzMKL0NoYXJTZXQoL0EvQi9DL0cvSC9J
L0ovTC9NL04vUC9TL1kvYS9iL2MvY29sb24vZC9lL2YvZy9oL2h5cGhlbi9pL2wvbS9uL28v
cC9wZXJpb2QvcXVvdGVkYmwvci9zL3NwYWNlL3QvdS92L3cveC95L3opL0ZvbnRGaWxlMyAx
MCAwIFI+PgplbmRvYmoKMTAgMCBvYmoKPDwvRmlsdGVyL0ZsYXRlRGVjb2RlCi9TdWJ0eXBl
L1R5cGUxQy9MZW5ndGggMzI2OD4+c3RyZWFtCnicnVd7VBNXGp9I5s5UUSizgwI2w6JVEVxY
7daVrU9eagV8gCisuoColJcCAQERCKLSsYISAhI0UVEBH1i74gNMLGrR1ragbH3VWu3WWkVl
t939Zs9lu3uTQBJ6evaPPScnJ5m5936v3+/3fVdGyYdQMpmMDUxXZiQlZph+T5I8ZNLoIdJr
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
zyecWKFdQvJJBYROXqVLOJ4lNClPFnYV3ijSlR7cdChfmyomsyFzl/lPCT5/baviXV2JOl9k
TVQVSLaJsA/weQ/DnU3482XldQ9w/ubGc2PmmYSDQsq+9MrpNeFVGyoztZm1m+vFBvbjK2fv
fXElfkmFYkeO2jrG9jI6i2bl9HOxzDq3vOTxVGTFJjj0lf2PkC0jwE8Gl10gX2aAKaaP6V46
lGTuD3a3jE5yL01D3Nemc8j4v8900yTnaOvMt4wv06ESNV9sPHBcZJuOJK8T8Of3bDqSZn7Z
cOCYyB47kpok4Bv3GLtb6kF0dfmF8PjUvNgEReaZZH2cyHJfJ4hp+SmJJsaCJ4noBN5dnq4p
1IluelFTXX7kOOwe9YHrLz0lOzbppNfIJbEVnPm45NTVq4+mnBY06PTRplOnkhvjhCI4P/h5
4wfm5yZbFURryqCCt/avPjsAm4/+hXNt+0fka6XfacG1+kgNMg41DGtROzq2VDoOp6j/AotM
vRcKZW5kc3RyZWFtCmVuZG9iagoxMSAwIG9iago8PC9UeXBlL01ldGFkYXRhCi9TdWJ0eXBl
L1hNTC9MZW5ndGggMTE5Mz4+c3RyZWFtCjw/eHBhY2tldCBiZWdpbj0n77u/JyBpZD0nVzVN
ME1wQ2VoaUh6cmVTek5UY3prYzlkJz8+Cjw/YWRvYmUteGFwLWZpbHRlcnMgZXNjPSJDUkxG
Ij8+Cjx4OnhtcG1ldGEgeG1sbnM6eD0nYWRvYmU6bnM6bWV0YS8nIHg6eG1wdGs9J1hNUCB0
b29sa2l0IDIuOS4xLTEzLCBmcmFtZXdvcmsgMS42Jz4KPHJkZjpSREYgeG1sbnM6cmRmPSdo
dHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjJyB4bWxuczppWD0n
aHR0cDovL25zLmFkb2JlLmNvbS9pWC8xLjAvJz4KPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJv
dXQ9IiIgeG1sbnM6cGRmPSdodHRwOi8vbnMuYWRvYmUuY29tL3BkZi8xLjMvJyBwZGY6UHJv
ZHVjZXI9J0dQTCBHaG9zdHNjcmlwdCAxMC4wMi4xJy8+CjxyZGY6RGVzY3JpcHRpb24gcmRm
OmFib3V0PSIiIHhtbG5zOnhtcD0naHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyc+PHht
cDpNb2RpZnlEYXRlPjIwMjUtMDctMDRUMTY6NTU6MDYrMDE6MDA8L3htcDpNb2RpZnlEYXRl
Pgo8eG1wOkNyZWF0ZURhdGU+MjAyNS0wNy0wNFQxNjo1NTowNiswMTowMDwveG1wOkNyZWF0
ZURhdGU+Cjx4bXA6Q3JlYXRvclRvb2w+R05VIEVuc2NyaXB0IDEuNi41LjkwPC94bXA6Q3Jl
YXRvclRvb2w+PC9yZGY6RGVzY3JpcHRpb24+CjxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0
PSIiIHhtbG5zOnhhcE1NPSdodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vJyB4YXBN
TTpEb2N1bWVudElEPSd1dWlkOmNkZTgzMDlkLTkxMGItMTFmYi0wMDAwLWJiMzNhOGY1MDYy
ZicvPgo8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczpkYz0naHR0cDovL3B1
cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8nIGRjOmZvcm1hdD0nYXBwbGljYXRpb24vcGRmJz48
ZGM6dGl0bGU+PHJkZjpBbHQ+PHJkZjpsaSB4bWw6bGFuZz0neC1kZWZhdWx0Jz5FbnNjcmlw
dCBPdXRwdXQ8L3JkZjpsaT48L3JkZjpBbHQ+PC9kYzp0aXRsZT48L3JkZjpEZXNjcmlwdGlv
bj4KPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIAo8P3hwYWNrZXQgZW5kPSd3Jz8+CmVuZHN0cmVhbQplbmRvYmoKMiAwIG9i
ago8PC9Qcm9kdWNlcihHUEwgR2hvc3RzY3JpcHQgMTAuMDIuMSkKL0NyZWF0aW9uRGF0ZShE
OjIwMjUwNzA0MTY1NTA2KzAxJzAwJykKL01vZERhdGUoRDoyMDI1MDcwNDE2NTUwNiswMScw
MCcpCi9UaXRsZShFbnNjcmlwdCBPdXRwdXQpCi9DcmVhdG9yKEdOVSBFbnNjcmlwdCAxLjYu
NS45MCk+PmVuZG9iagp4cmVmCjAgMTIKMDAwMDAwMDAwMCA2NTUzNSBmIAowMDAwMDAwNzY3
IDAwMDAwIG4gCjAwMDAwMDYyNTggMDAwMDAgbiAKMDAwMDAwMDcwOCAwMDAwMCBuIAowMDAw
MDAwNTY3IDAwMDAwIG4gCjAwMDAwMDAxODIgMDAwMDAgbiAKMDAwMDAwMDU0OCAwMDAwMCBu
IAowMDAwMDAwODYxIDAwMDAwIG4gCjAwMDAwMDEyNzYgMDAwMDAgbiAKMDAwMDAwMDgzMiAw
MDAwMCBuIAowMDAwMDAxNjM1IDAwMDAwIG4gCjAwMDAwMDQ5ODggMDAwMDAgbiAKdHJhaWxl
cgo8PCAvU2l6ZSAxMiAvUm9vdCAxIDAgUiAvSW5mbyAyIDAgUgovSUQgWzwxREIyM0NENkRB
MkZEOTNFN0NEMTg2NjA0NjgzQ0Y0MT48MURCMjNDRDZEQTJGRDkzRTdDRDE4NjYwNDY4M0NG
NDE+XQo+PgpzdGFydHhyZWYKNjQ0MAolJUVPRgo=

--------------vqwgTcfJWrSuT0w4CSU7Jkyg--

