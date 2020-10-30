Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4159029F9C0
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 01:34:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMjxG2K2pzDqdj
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 11:34:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=QnxaZMwQ; dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMjwM17jCzDqdg
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2020 11:33:34 +1100 (AEDT)
Received: by mail-yb1-xb33.google.com with SMTP id s89so3693582ybi.12
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 17:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qoK5AblYnWfoDn7wmPr9BcRsJDhbT8ASreDhzQzD2FE=;
 b=QnxaZMwQoewyYAxnDN81eDfTVmry6TZUJve9BrpUNop0JfKdFJd/H7v7cgrB5eRv9c
 8SGZW/f+Gep+Eae4xzO4ks63riMxVQOtDW1XA4JMrXIZt87eSutvNWFRyeIKhH86bi2q
 s5KKOQcknVEGURVAciU87wNjqzWco7D7C9kXVFomVVQhQ2ACFbHpOa0boCnRvl3d/uZ2
 Ro/Kn3c8J3G44ouCxAAtzDyOL6Rf3P8ahoAaDUi8/gKHYMuQXwwVDMD9LxEf43jdQiLV
 8+C8ewlUDUi+jHvZ1tN5aupahMPUDLmC/eeylBG/eZjz6eOM/6Lj6IKt6x+sEFf/gXlb
 PyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qoK5AblYnWfoDn7wmPr9BcRsJDhbT8ASreDhzQzD2FE=;
 b=F2kYR89fvj7HsKdcxQ0Pyo23d0RRjhpxylfTCEARmGf69aWj+j60KPzRLgAGwmRmJT
 q6h30EP2dzpJdG1tLevyPAHBTeMVczi8TtRqdyTBOXGPmKhIit5PvW1Tph6r4H+DQ8xr
 jsul/rZhzu/0sExjW/PBLteEh65p8LKRRZdWeq/pHgj+Wisp/ZpoafG6XqZlW1SWst9P
 vK7Eg/y9XPMFxhBUcrL4biXHUDpBKTNm6RgaCCNiKC6NMmggoXoteC5k8CbgVtKEJXUZ
 CijoouVRKJKWuIdDgy3Oudoia3wwkYx7Pe6S+3fQev0rxTLWGkQHIF/xreTQYvROI71N
 PC1g==
X-Gm-Message-State: AOAM533bbc+EhMCVANEcyPPUqXooja0IivUe0vtOuYt1CtzFU7x6MTwc
 B2kwTKEGrZT0YvHRy9Grs5zfmz7dap2u4/DSvTHsPw==
X-Google-Smtp-Source: ABdhPJz0w4T3MnUZelSQmURHM23x1IVsnNk6CO6hO6KEz5yn7hVV42ZlV7/SZHs0fLhH9tGZmdcspsThc444j7tkzVA=
X-Received: by 2002:a25:517:: with SMTP id 23mr95730ybf.148.1604018008876;
 Thu, 29 Oct 2020 17:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <282BE4C0-9C7F-4CC9-850D-729C95B137A3@fb.com>
 <BC8657CB-6E3B-4F1F-8301-367C6EDFC658@fb.com>
In-Reply-To: <BC8657CB-6E3B-4F1F-8301-367C6EDFC658@fb.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 29 Oct 2020 17:33:19 -0700
Message-ID: <CACWQX83qbxmQo1Hs50CVnKkBK_4P31AdVmoU+P9Wmwb6z2ze7w@mail.gmail.com>
Subject: Re: bmcweb upgrade blocking
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
Cc: "OpenBMC \(openbmc@lists.ozlabs.org\)" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 29, 2020 at 5:20 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Alright, after verifying almost 40 commits, I found that which one is breaking https://github.com/openbmc/bmcweb/commit/b5a76932eab7d40487ffb305cd745ec155813c4e
>
> This commit introduce blocked on response for update service.
>
>
>
> Ed, Can you please look into this.

Yep.  Thanks for nailing it down.
