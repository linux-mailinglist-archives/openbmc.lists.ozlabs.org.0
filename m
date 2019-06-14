Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3D94639F
	for <lists+openbmc@lfdr.de>; Fri, 14 Jun 2019 18:07:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QQVL4H8ZzDrgV
	for <lists+openbmc@lfdr.de>; Sat, 15 Jun 2019 02:07:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=derick.montague@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gMNOB1x/"; 
 dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QQ6B05fbzDrTG
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jun 2019 01:49:53 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id n4so3013679wrw.13
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jun 2019 08:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vjoLRhnQi4FTikAP0zq9brFo/SkJaL+BJgXjmgGBH1g=;
 b=gMNOB1x/4AC8u3SOdyMne2LY1Ppdg7z00L6obAfIejJTi7ZNgMrdg+R6st5IkRHMSW
 lVxY44CxLrlf/KN4Od5mWRzJTEVuj0LfqYSMp0L7e/s9dsHQnDnBxxe406fhbTTPzYdu
 Sra4fApxVJFcphH0RGQl++ajYhV9H8xnet28roayMUIugpt3YqvRZcLj0khtnquIM4NQ
 4NIu8Alok89XKeym+LlmXR+H6VGYS38MYz+S387ymqZhgXLpSNdIVNeczpOVGoPV9MSD
 rb2k5nMOZUnNfSkncVPTTlm7WHWc7qP4FwUcO4JTpWkXJudH48uEUqikqScEOpjnG7NW
 cQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vjoLRhnQi4FTikAP0zq9brFo/SkJaL+BJgXjmgGBH1g=;
 b=K2rmmxVMVTlNeJck9j4fqkZV0SQ4glq20n+RCnYaq5q5js5c/Lnt6QCTVVTUKNcUDw
 xMb7GLqdYZ6qa50agTh0cNy70Ty7blmkwcfhrQhe92d4VxTZ/ugiWFf5FebWsxdXxJKT
 YxvbxRL5d6VK8CUOX/6n6WhTm+IAV6gTR7TkPP0zf7e0obG75MToU3mhUpzmYfq39kF0
 fobqXZ19oCzxWJ6HJ2UQExa2PKbIIDJbVQXr2JvlXqHHzccZ/UcdYwqBUqNE3om1yHkK
 sFmBJ0ZapcW2sDIauuI6PyzWpdUmAqldR2C6yeh1fGTeChtw9EB+3Gd7NXe9J11ocrAU
 TgFg==
X-Gm-Message-State: APjAAAXKw630z99p4xOeGAAdICBJ7gHp+aTYbHQZytjWtGSJVHZYJnON
 wg26PpNFKWmy2zfMii65mYIji1M0KofaOqWG8bg=
X-Google-Smtp-Source: APXvYqy9IvX8E9XTZiS/FH9ir+c6KVqxUhEcVA+eEYcb8luHjaMA86aewvjCciOAODV0YdoOLHsLLVSyQ+1ncYpekVU=
X-Received: by 2002:a5d:5448:: with SMTP id w8mr31779077wrv.180.1560527387818; 
 Fri, 14 Jun 2019 08:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAMTupoQuV9AVpqvVu5E1M_vk3FkcQbvsdKR_ngUJFUai_MiFcA@mail.gmail.com>
 <0dde6e4b-484c-6d44-7e36-92551dbdd460@linux.vnet.ibm.com>
 <CAMTupoTQ=xDx9jpPQ+MhsBpKT_sg2vPcmTne7josv7FbmStA+Q@mail.gmail.com>
 <bfbe24e5-25dc-a7fd-ab14-2dae8801a5d2@linux.vnet.ibm.com>
In-Reply-To: <bfbe24e5-25dc-a7fd-ab14-2dae8801a5d2@linux.vnet.ibm.com>
From: Derick <derick.montague@gmail.com>
Date: Fri, 14 Jun 2019 10:49:36 -0500
Message-ID: <CAOUmYFRphf6EEb9zbK_0O8BXgytghrZw=Wa9rH2LsQaWOKEgPw@mail.gmail.com>
Subject: Re: Network Settings GUI
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>, Jandra A <jandraara@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> Is the GUI specific for IBM, if not then I know google is planning to support the IPv6 and the gui should be at par with other available stack(AMI/ATEN).

We have presented the design to the community continuously for quite some time.
We are not hearing that this is needed in the GUI from customers or
the community. We do
realize there is support in other stacks, but we have not heard from
any users that they use
it or plan to use it. It wold be helpful to know that the expectations
are. Is Victor Hu the person
that is talking to Google about their support need and expectations?
