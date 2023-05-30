Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0702715642
	for <lists+openbmc@lfdr.de>; Tue, 30 May 2023 09:11:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVk8w5F4cz3fCg
	for <lists+openbmc@lfdr.de>; Tue, 30 May 2023 17:11:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
X-Greylist: delayed 446 seconds by postgrey-1.36 at boromir; Tue, 30 May 2023 17:11:25 AEST
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVk8Y1MTTz3bgr
	for <openbmc@lists.ozlabs.org>; Tue, 30 May 2023 17:11:24 +1000 (AEST)
Received: from [141.14.13.91] (g346.RadioFreeInternet.molgen.mpg.de [141.14.13.91])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 882E761E4052B;
	Tue, 30 May 2023 09:02:58 +0200 (CEST)
Message-ID: <d53d5415-753c-6680-d772-a3f26c134037@molgen.mpg.de>
Date: Tue, 30 May 2023 09:02:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v5] board: ast2600: Add
 Inspur SCM V1 board
To: lintao1890@163.com
References: <20230530030320.548408-1-lintao1890@163.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20230530030320.548408-1-lintao1890@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: lintao.lc@inspur.com, openbmc@lists.ozlabs.org, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Lin,


Am 30.05.23 um 05:03 schrieb lintao1890@163.com:
> From: LinTao <lintao.lc@inspur.com>

If Lin is your given name, and Tao your surname, should it be spelled 
with a space?

     git config --global user.name "Lin Tao"

> AST2600-INSPUR is an Inspur SCM V1 board which is
> equipped with AST2600

This fits in one line as it’s less than 76 (≤ 75) characters.

> Signed-off-by: LinTao <lintao.lc@inspur.com>

If your name is spelled with a space, then you could update it here too.

[…]


Kind regards,

Paul
