Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2D48E2E7
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 04:52:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4689wY5k7BzDr0v
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 12:52:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::735; helo=mail-qk1-x735.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="mYtmdyJJ"; 
 dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4689vt39RfzDqrM
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 12:51:52 +1000 (AEST)
Received: by mail-qk1-x735.google.com with SMTP id w18so115974qki.0
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 19:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XG2YEcybHgH69efKDpC/1iB4/sndj3os3UQZ8pPeBMU=;
 b=mYtmdyJJwbm1dXDQhexyYJelh062tHf8SfLRn9xrRb8E9Yzlo1AZpWNEve4qEX9qjy
 JAEMn7Tbk0BPawglwdy6KTVf6th8arQzgjs1cqJY1N4zM7JRZlSZtwJi1gXUbM/JgIDV
 ZFJ68f83cixttMh8PdtMi24L0tthJVxAjL49AQdGIB+kpY36e2xgHhtgarw1ovZ3PWxH
 AA0nw3czuskBD2bo9175K7h6lD9wWyjViTzMALt6GM/KhkM4sYyPglG9Wl+26Z0o3l+k
 RNkpLAUjkqBYdo7CR8QwLFEiTBJqSEiKfwd6PoINAPckmR7RGz+r0EFCLu2LOlUaUYFd
 hesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XG2YEcybHgH69efKDpC/1iB4/sndj3os3UQZ8pPeBMU=;
 b=bullbmYXQ4JNkwWm3K3SlfYHptDTGNR5hrNVR8vzsk8SHM2Y92rhsO1uh7SWRzs8aF
 wxjJihOTc4L7buqegsDRrvTSayQ3lpdNqOThD8ns8MhM6iyxKCzwwr2wYktH3KpAA321
 LPwkrFFBZzVq6ipf0LgAqGXfhQsP5NNULoPWeAt9ECxD6Ke70GYVc+t6QaLF4t5nH7Z3
 ZWntszpAsOReLC1Ct7VqR5wqMdkcbyukeXB5wRHx7PZPNsiU+wReSzpUyxTxXmemic9o
 qzRHePXLpNlihWmluFiow2QJJDuCPFi2gZQk0swhB17QjFyiqFw6+6ys8JtNMMQJYHHI
 MWqw==
X-Gm-Message-State: APjAAAXZzL58PIcvo/cNOksfnFIlvfvvDWNgGzc9HBmflERNQlk8JHJi
 PLKGrPXAAwNHWycI809ZVduHa2/PDA7kyYfjWaamIg==
X-Google-Smtp-Source: APXvYqyvy6AyoA7z+XIQ8O8HAXMoY32Dfl0N7Vpw+MccHbEKHa9P/ZFhCAl5eguJBLI+vwyb1RgxvXpRSrd6Gsz2q74=
X-Received: by 2002:a37:9f07:: with SMTP id i7mr30721qke.485.1565837508509;
 Wed, 14 Aug 2019 19:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <FB0EDEFC-F92E-4F6E-B6BC-B0C5E7AD6E73@fb.com>
In-Reply-To: <FB0EDEFC-F92E-4F6E-B6BC-B0C5E7AD6E73@fb.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Wed, 14 Aug 2019 19:51:37 -0700
Message-ID: <CAJoAoZm9QpFgRdCsxoaNuCu1YONm_CFUp1fhdFj+h5uZhuCzAw@mail.gmail.com>
Subject: Re: Historical Sensor Information
To: Wilfred Smith <wilfredsmith@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Aug 14, 2019 at 4:05 PM Wilfred Smith <wilfredsmith@fb.com> wrote:
>
> I presume most vendors desire the ability to query historical sensor info=
rmation from the BMC.
>         Has this feature been implemented already? If so, please direct m=
e.
>         If not, has someone already begun development?
>         Is there an existing specification or write-up?
>         Any =E2=80=98druthers or preferences on how I might proceed such =
that my effort benefits the wider community?
>
> Wilfred

I think that the space constriction on many BMCs has left folks to
instead query over IPMI/Redfish and compile historical information
elsewhere. Can you tell a little more about the use case and indicate
why you would rather save history on the BMC than off the BMC?

A related topic which - as I recall - was discussed and never
implemented is the topic of metrics reporting. It's possible that the
community has moved further on these topics than I remember, though,
as I've been fairly out of the loop lately.
 - Emily
