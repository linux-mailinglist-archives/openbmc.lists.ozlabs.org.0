Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D45EF32B6E
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2019 11:06:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HTh331MhzDqS3
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2019 19:06:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Jfk/k/nO"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HTgc00BjzDqQK;
 Mon,  3 Jun 2019 19:06:19 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id s57so1313436qte.8;
 Mon, 03 Jun 2019 02:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uuTtXgYKCS+rLnCw5KUGVKN51OqOl061vtAgonSVQAU=;
 b=Jfk/k/nOOv0jJojPBUMsLOuESrqVO/7Eg88kuyfWMSg0PMXOJAPZSV+Vt6+VcCJ9kr
 3xqx8V2WtAnTRlT3+bDuxb/4oWhaUJ4OZZbKMiI0KWvWCjbYGTlrg004YiwZQvnrlp/b
 KpD4eZ+JN+9XpoAu6YcDxHEsBJz8JwPzVG5c0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uuTtXgYKCS+rLnCw5KUGVKN51OqOl061vtAgonSVQAU=;
 b=h4FfUQ13K+fNkSmX6U0+b9ylzuwteu7wkdg/h9fKWwlCXf1hfVt6G0zH23Qfxhquec
 3ki0qH+1pIfJK6dKp4aXUt60q6kHReKeP4m9HUyajeBRZ9+oeyeXGSwFHVFNuUAVn8HT
 3fWr/Db6kSMvtRPhtIkJc3C2PRCW6kwhc7Kku6PiiXtD6u7Pa3W2GGqubInZnT6eotvu
 z5XHu7IXzZPRYM8LSWOzjakYn4p/XM6S1R9QomRpxXQzYgpKq15e7d7Ofm6uh/ZflP2/
 nGzl1fYZCqprEa9ssb6Wbvehy4j5HCjivEOxgCYxvGPU87Edm5X4wSJGtOsaCi8khK9R
 bq4A==
X-Gm-Message-State: APjAAAW01JR9YcLXccwn9SMVVVu2MQQx+jHU1mvs2VVC2Fed7nIgCqaB
 YGou8VdHOr+87qusf1hqr0n3JthKW9NsWiFL7bE=
X-Google-Smtp-Source: APXvYqxXL4XpJm4Q9w3aB76cm+fEZ4Vkh8ETi/5J85sfez3A19+tWFwqSG2Zq018aqx/s5lZCatLw6hkwQQUBTRWegM=
X-Received: by 2002:ac8:5518:: with SMTP id j24mr21468918qtq.255.1559552775802; 
 Mon, 03 Jun 2019 02:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <1559334700-51970-1-git-send-email-anoo@linux.ibm.com>
In-Reply-To: <1559334700-51970-1-git-send-email-anoo@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 3 Jun 2019 09:06:03 +0000
Message-ID: <CACPK8Xc8_SAkxQ1_HTFOkCsV8ejWS=MVXazH+bvDcE=9xKLF8A@mail.gmail.com>
Subject: Re: [PATCH dev-5.1] ARM: dts: aspeed: swift: Add VDD (IR35219) devices
To: Adriana Kobylak <anoo@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>, linux-aspeed@lists.ozlabs.org,
 msbarth@linux.ibm.co
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 31 May 2019 at 20:31, Adriana Kobylak <anoo@linux.ibm.com> wrote:
>
> From: Adriana Kobylak <anoo@us.ibm.com>
>
> Add the VDD (IR35219) devices to the Swift device tree.
>
> +       ir35219@70 {
> +               compatible = "infineon,ir35219";

There's no driver for these in our tree. Do you have one coming?
