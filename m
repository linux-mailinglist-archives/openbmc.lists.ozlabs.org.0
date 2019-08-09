Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1073A88069
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 18:43:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464rfN6BnHzDrKL
	for <lists+openbmc@lfdr.de>; Sat, 10 Aug 2019 02:43:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LLLOtmah"; 
 dkim-atps=neutral
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464rdj1VV7zDrD0
 for <openbmc@lists.ozlabs.org>; Sat, 10 Aug 2019 02:43:02 +1000 (AEST)
Received: by mail-ot1-x335.google.com with SMTP id n5so135050335otk.1
 for <openbmc@lists.ozlabs.org>; Fri, 09 Aug 2019 09:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=aClvhzQ9aRVObYka2beIi0SVfUoXvBXS3xZtge7Ma9w=;
 b=LLLOtmahWifeVnVcbASu1UIVBjVDTpGVKtY5xOuUYUfprxipy1hAdGyiOwDdjH9CFh
 LoN1+Lf1CQzT7ztZvp6l9aMv3XsQm8XlicUEaYRNHPyW3WM/bKPMtwkPWoW49M86NcJz
 3VUFS4h9clP6ABqsW64FopgTholub7oJmCrO4TTbPqYnqkAr0InUH8qQ/Mw2aRXAePrT
 oCf2RRnFn4+BGFC8risOVWP5nQXCISJ4TuWa/ifCzT6NjLtc2+brFehv9eftiw7nR3q4
 K0jjteKVKxKXBZuWCGHMcMQHryI2VY9cIUl2ffmwQtSfOgcuimG3edKNgPT/q0x0dV6q
 X6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=aClvhzQ9aRVObYka2beIi0SVfUoXvBXS3xZtge7Ma9w=;
 b=FebsuMETu7k6B7N2yS4Q1DzafpYfADQ1q+cNL5uiAoKNn1oTNnC6GpSD/xBEbKmXUf
 v0RjmfbXSvgbApgSkkyC5uSM+2pmSuqQGmmfEJ1RTGUvSvlJNxm/SKJxpjB0oZNiI19z
 MGtO07S1fTcxWSlnOf+PWErWyPFdTpzJmMQi44dYslL15pfoS2Y38/NUgMJiBLBJ4mKl
 t4ZPrpvfRv7rkCxnVo4jCy/au2/O/kQBOt0O8bvgX3fsfIuHjurehwGlR+mg5vjIlw+T
 u16XsP1rtzlg4bEWbYStLlhQdQGSejklACIplts45+/SoOGCuWXIGQMPkzWI2iPeSUKW
 2Xhg==
X-Gm-Message-State: APjAAAUH4RCXyeMgA+2vI/4okDwji0cHjODDUwrRC7nZnEzvluVFhEx9
 MVlPMcV0EYaX9zRFnNQRmtzFIlE8
X-Google-Smtp-Source: APXvYqykZsROYJlBQM4m+bj7GvKz04qVO5SqWpIp8v/4gSEy6X+dg58You8TP92xWU/n5WKj2BSSCQ==
X-Received: by 2002:a05:6830:2099:: with SMTP id
 y25mr17175148otq.372.1565368977912; 
 Fri, 09 Aug 2019 09:42:57 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id l15sm33237999otr.38.2019.08.09.09.42.57
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 09:42:57 -0700 (PDT)
From: krtaylor <kurt.r.taylor@gmail.com>
Subject: Release Planning Work Group meetings - Now in IRC
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <eed53539-db27-830e-e8af-90fa3fcfcfa6@gmail.com>
Date: Fri, 9 Aug 2019 11:42:56 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hello all,

I am moving the release planning work group meeting to IRC. It will 
provide a way to multi-thread and expedite conversations with automatic 
meeting log/minutes.

We will start the first RPWG IRC meeting this coming Monday. In 
preparation, please make sure your IRC client is set up and you can get 
to the OpenBMC meeting channel. My hope is that if we start using IRC 
for meeting to discuss work, maybe it will be more comfortable to work 
with others in IRC.


We meet every other Monday, 3:00pm Central Time

IRC Meeting: Freenode #openbmc-meeting

See RPWG wiki page for details and agenda:
https://github.com/openbmc/openbmc/wiki/Release-Planning

Kurt Taylor (krtaylor)
