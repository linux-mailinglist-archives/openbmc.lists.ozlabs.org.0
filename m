Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9FB3D70C7
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 10:04:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYq852zKlz3bXm
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 18:04:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Ba3re0ub;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Ba3re0ub; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYq7n26n5z2xKb
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jul 2021 18:04:20 +1000 (AEST)
Received: by mail-qk1-x729.google.com with SMTP id c9so7745897qkc.13
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jul 2021 01:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MqV66ED+yFrlRGvKPHOaCvxiautjwePwX/W8LogGsPc=;
 b=Ba3re0ubZPrrlclR6KbTHRPTiR2FnApBEgMfNIsoqz7jxQ8z4zj2QSA9+RUZFbCggz
 ep6vxpYlXoZ4/dVYAxrbUfKdq0uQRmPBC19xCuvY9EUECoDjWPL5AA6k4YQjeINLJQqu
 ZVKZOI8NDnOpQKOTQtcLk0b/Lrim93tsuDDx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MqV66ED+yFrlRGvKPHOaCvxiautjwePwX/W8LogGsPc=;
 b=BtSw2gxZGvkI+mTD0VIH+DBVQSUlA0gyiJjWawsAr2xZjGzUOEyI4ZFSqwiX4jsvNy
 FwJ8U/DmTazb+kygff8juC2cYGhiGUy/LVkSdOVhmWxm2cwKw1x0RL/Q6lC5tUCfzw2j
 Ltf+vbXHCccs0IbDz9W+eGYPYnXaG6gR3L6Fg0S60fs++MrpOrkGeSOwB1tq+kyOENBn
 b72UFYRT7r4OqP67lx8pTXhDzwIhWDOFS4HNCkzUlnJA95keOCpshau9DLfKG7r5FCLr
 2/nay81qEA84xd7lRqQvblsM6ZFRcrq0ZARkz7iQ/SG4sIkc7IUq5gM/ZL0D66Y9So07
 lxtg==
X-Gm-Message-State: AOAM531uPsnQpJgzyEs3eDhv1aPcz9ZIHOoz2kiYAPnrJGwyGwoG0K7l
 bCHPd6l15Uj2SEtZr6+zeU10rZ2D/3/2o+ac06PVrSoK
X-Google-Smtp-Source: ABdhPJzMltXYO7/89xrHKeahDB04KLRJs3dVXmApS9WZlrb9zdxKv9fhNBemOm4CAdWAtXrcfAiRxbEYVL/fq3OEWPQ=
X-Received: by 2002:a05:620a:444d:: with SMTP id
 w13mr645909qkp.273.1627373056887; 
 Tue, 27 Jul 2021 01:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <623110cb8acb4bbc99c43c47b37f5457@TWMBX01.aspeed.com>
 <9C742B6B-8604-4EC1-9AE8-98844ACB557D@fuzziesquirrel.com>
 <HK0PR06MB23218108A08BC07208A93909E1FF0@HK0PR06MB2321.apcprd06.prod.outlook.com>
 <CAN9Jwz375dV0fFbBaE_SK6Cw8t0pyC-j-fPFuK5tm_EATWoFmA@mail.gmail.com>
 <HK0PR06MB23215E570FE7381C47EEA024E1E99@HK0PR06MB2321.apcprd06.prod.outlook.com>
 <HK0PR06MB2321716D4130BC0F706AB274E1E99@HK0PR06MB2321.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB2321716D4130BC0F706AB274E1E99@HK0PR06MB2321.apcprd06.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 27 Jul 2021 08:04:04 +0000
Message-ID: <CACPK8XfuhPDd9aw4L2+gbUfMSnMoBX6-D8yc+FwvPaZzP_EtuQ@mail.gmail.com>
Subject: Re: Signed CLA from ASPEED
To: Luke Chen <luke_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "manager@lfprojects.org" <manager@lfprojects.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 Troy Lee <troy_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 27 Jul 2021 at 06:47, Luke Chen <luke_chen@aspeedtech.com> wrote:
>
> Hi Brad, Manager
>
> It seems my previous email was blocked out due to the attachment file size is over 128KB.
> The attachment file which I sent you is the signed CCLA pdf file.

I have moderated the email through to the list.

Cheers,

Joel
