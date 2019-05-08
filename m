Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB4117458
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 10:57:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zVjq61WdzDqGL
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 18:57:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::12f; helo=mail-it1-x12f.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CYnY++la"; 
 dkim-atps=neutral
Received: from mail-it1-x12f.google.com (mail-it1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zVj45ZrZzDqGL
 for <openbmc@lists.ozlabs.org>; Wed,  8 May 2019 18:57:12 +1000 (AEST)
Received: by mail-it1-x12f.google.com with SMTP id m186so2751377itd.4
 for <openbmc@lists.ozlabs.org>; Wed, 08 May 2019 01:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9s4VZm0PCcy4igfagpz/g9u0fTnyj2jJNfVOR8ri8Es=;
 b=CYnY++lahO6eAFdvzL8PLfcfrS6MTn33t24MRdpQwB38Q4ePj4umDg+KoU+vYoxeMC
 5Ex+Nfiv2q+OT2vPGZnR2Vtg8ROm4s4AUiwjPQRnGd/tpos9AneX97kr3HVwpKvcK4vk
 oqDDWu8gH6bbsiJAsrABkHylSkC9DXbCECzclGybMDlI8N88mZMcQEZJFAUjbxtRrip9
 hPXuiXjni8nkldIA+KDeACYtibjBsCxIT8XqVXYMvvxnk5aPt5JnlomeJxp9z/9e2ZH8
 vMtQLDVnWjWZAABByYtHLVGkzHg09HfzlPdPa7T1NdW/ApRgk4j58ZHU42caeNfiQwu4
 b2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9s4VZm0PCcy4igfagpz/g9u0fTnyj2jJNfVOR8ri8Es=;
 b=rhuHE3XRv+HeZ1AtsJjUWC0OtCtWFBcJA7WK4DB1JDiQsEV+SHZILUPKkqN0GOTlRi
 329KzSBDUnlMTSRKu1f7rqJko5U9pGfmfg8ucexMaZT+85R4vDtyUUOEY1q4G5apQocK
 0i5BmGuv3Aymg3wG36d2lCMyCQ9rt620N4o9wKWvsJ5sAM3KCwr7wX0x25ankp9qNnp/
 qWqgVzyWbtcLnRXaH3mSCCK7RwIZZu+VN6Vh7FOmR0FOxQaIfAwaF6eT4I6TAGQ23lnU
 FhsbGB15QRSKOlv58fBs0dWRyXgbDcGutMApRNh4pTemKvNwlag7SCx+5eYnwi4qRATg
 WvqA==
X-Gm-Message-State: APjAAAXoETrYkDDqttZnz7D8tEzaqk6G/3qE1vQuYYt/SJ5pDjIk+5bR
 Bg3UH6sOO/TQKKVoLaoJA3N7Yb7lldVgr7kKlCU=
X-Google-Smtp-Source: APXvYqzOVZ01ZiL9df49plCcfOQVZ3RvnrsAdUNo2cbBWVB+wJKgLo8dlO4Z3eCxLLZGFcp9+EdZvuTB3NmpLQ415Xw=
X-Received: by 2002:a02:b088:: with SMTP id v8mr28165498jah.21.1557305829349; 
 Wed, 08 May 2019 01:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAN9Jwz1wvT0nhoTb8K9Qf-MTARc3q8kxRQXSH1TCA0e5nJFY4w@mail.gmail.com>
In-Reply-To: <CAN9Jwz1wvT0nhoTb8K9Qf-MTARc3q8kxRQXSH1TCA0e5nJFY4w@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 8 May 2019 16:56:53 +0800
Message-ID: <CAARXrtkqY+vLUsUmDMiL4o+ZpP4whAtRiqFB5At_PhR7dFD7hQ@mail.gmail.com>
Subject: Re: How to deal with incorrect firmware image in
 phosphor-bmc-code-mgmt?
To: Troy Lee <leetroy@gmail.com>
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

On Wed, May 8, 2019 at 4:37 PM Troy Lee <leetroy@gmail.com> wrote:
>
> Greeting,
>
> With the method xyz.openbmc_project.Common.TFTP.DownloadViaTFTP,
> does OpenBMC have a way to know that TFTP download status(completed)
> and the downloaded image is incorrect?
>
> It would not be a problem if the image is correct, since we'll have an
> InterfacesAdded signal.
> But if the image is incorrect (untar failure/signature mismatch),
> we'll only have an error log entry generated.

What is the expected behavior if the image is incorrect?

> Or if the image has the same version id with currently running image,
> the behavior will become unexpected.

I met this problem before, and I think we may discuss the expected behavior,
and fix this case.

>
> Because we have another service wants to integrate with firmware
> update service, having a way to confirm the image file is nice to
> have.
>
> Thanks,
> Troy Lee
> --
> Yu-Ting Lee (Troy Lee) <LeeTroy@gmail.com>
