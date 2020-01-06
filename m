Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E65131C17
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 00:08:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sB5h2yPjzDqGM
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 10:08:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="QOtkO7+u"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sB526hnzzDqDq
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 10:08:20 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id 21so41094916qky.4
 for <openbmc@lists.ozlabs.org>; Mon, 06 Jan 2020 15:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hN8CyCJYvNU9I6Cxi7JDORQZij4sF9PJu64S2S9qr6E=;
 b=QOtkO7+u2HudqvKYJVVRxw08eilMHV3scSSh3YIR3IsFf/GbYHuSwu7gUSFsBszE56
 YMsgX1m/Irgsz4OHX9Ze01m4HZnMqRzYxCoCqlo+QFGc3e3pxfS7Us/wzDSToyKQZZRf
 EJ5vndulbPx6rGK3Lzs0VnttP7DjQkMUiwRwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hN8CyCJYvNU9I6Cxi7JDORQZij4sF9PJu64S2S9qr6E=;
 b=KR8A81ekXHvhT5wKnmqKkKvreYt1IiDZtHJ1awFqrr0/ZlZZDvVdzU5craK5LPkvle
 PJrknB89know+K7PAQpkMNTf1DuFI/muWl3fZEjls/lHc+O0Tdep7sykPq+lz3N5yMhV
 TqYuK9fi4WJggPBaaigxfqV7wFcrFU1ZPEXqN++DxFuECc0d+cwuAc//h4bTeJjzoeRF
 9ZneAYMgrgwh7Y22bDj7uS3Ag3LDL21y25gYioT0mVWeCMYO+uIcCcwcLbfIo6sB5qe/
 ysqEgVCe04uVKdNnrJ8oZXuGiB2Eea08vljhgURIpoVYxJ5qXvnz4joja171l2drmVFz
 qo3Q==
X-Gm-Message-State: APjAAAWIOoniLKVp/yqdgEoJzbnNWZ6ChwBx9lZtQZEeaUCbC3sv+xG2
 sjdMVhnFbsqBsuJgBUiMNlxPL9gbgZWjHVtfHT0=
X-Google-Smtp-Source: APXvYqzcflcCPRcGPLI9tNeLc3jPDYoM8EGgFBn1+s84s/j9Rjg5dsZxC1F3IRT1di3OmRDG1R4nDWEI7tr8h/J992I=
X-Received: by 2002:a37:68d5:: with SMTP id
 d204mr85316240qkc.171.1578352096822; 
 Mon, 06 Jan 2020 15:08:16 -0800 (PST)
MIME-Version: 1.0
References: <C8678983-8901-4E16-94BB-6C6AF0959B62@fb.com>
In-Reply-To: <C8678983-8901-4E16-94BB-6C6AF0959B62@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 6 Jan 2020 23:08:04 +0000
Message-ID: <CACPK8XfhySvWLCTAR54Z8cjW0ne0-W1WFifk4=pKL50J3bGU_Q@mail.gmail.com>
Subject: Re: Pulling ipmb patch
To: Vijay Khemka <vijaykhemka@fb.com>
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

Hi Vijay,

You sent this mail to the worng list. The linux-aspeed list is where
aspeed related patches for the mainline kernel should go. Instead use
the openbmc list for this kind of discussion.

On Wed, 18 Dec 2019 at 20:58, Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Can you please pull IPMB patches from Corey forNext tree as below into our LF kernel.

There is no such thing as a "LF kernel". Do you mean the openbmc kernel?

> We need this for ipmbbridge application.
>
> https://github.com/cminyard/linux-ipmi/commit/0d8633bf5311177c9a26d75daec677cd87e3261b#diff-7708853244e5bf8cd10d205ee1f5dc2c
> https://github.com/cminyard/linux-ipmi/commit/042f057fe2dcf38682d85d9f88df00d1a8d45dbd
> https://github.com/cminyard/linux-ipmi/commit/380665becdeeb4f455c23582b7f32e6b3cea27d2

I've applied these three. Well done for submitting them upstream first.

Cheers,

Joel
