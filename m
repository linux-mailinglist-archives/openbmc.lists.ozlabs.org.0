Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF2429D0EB
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 17:04:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLtfn6d1lzDqJk
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 03:04:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::333;
 helo=mail-wm1-x333.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Tem5tPRV; dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLtf24hLmzDqSY
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 03:03:20 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id c16so77167wmd.2
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 09:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V/I8CW5jiyh2g616SdNEaTCXTi0bhbLaNaPGbohSjnE=;
 b=Tem5tPRVxpnIh9qkFGddqyfimFUa5+HbmpphvwXZ/IR6S7zs5AstOSzuTszNg+9b/o
 O9grFzDyjUGUYLQJMP3XLdxV7e0vhKwxYB7rQ11/mKWEWKV/6iYvUHbvOLGgekZlxCqL
 Y2E12Vm1Oz9sLGSqcxDVq2Hfvn96A9cy4XM55bfOigZpuSLwxkzdtitbdOhiwI2k6plD
 75T+1fOlQAiosm7xVoIybxJSBWxdsJN4fV75lbZH7ZNQDqPh3WKjoZ4N0us+enNVGE8Z
 rlDgexWUu7txs+gvwA2KN+UVy0y0CDt0iGbleu/HSNiw+76zePOeraqicsKUjR3AWQVn
 WSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V/I8CW5jiyh2g616SdNEaTCXTi0bhbLaNaPGbohSjnE=;
 b=SuMdnF8OQ3RKSr9Mn/qfLTIoOoEJOmRE5CETXySBJ3HZWKj72gV/eo7XZK8IJScZqw
 JcYzoPNn5lgomslligphbXRIkYGb+qXY/LLFBSxCA7ZMftxoxNVMX57MJuNxG62gyW+w
 WlwxYuxzZSZkXO6SlFNFtINt9HOxIiiXfR81qVz2Z4oNfjROR371BY/7ujrt3GT0s6S9
 W0RgVsM9CeFj9I0fX0nqBbQVnCB9UtSudp8umPofH8faWdyCcLIsZM/TsGm9V5AYS1kA
 pTnEomxKx0jueNIxpTwpj3fmy1/71FV33kGjKQiKy86+umRxxpipTTvNfn6ZoHvGjDVr
 D6cw==
X-Gm-Message-State: AOAM531OBmQe1X9aObD4OhWNiVBEdb5cp2kTwc4Ug0yTAiNswlg/q0Gr
 7iv1NSbtKdQ0kqvJjy/aUOstfhbZUGLv/mxByAEbXA==
X-Google-Smtp-Source: ABdhPJx1torpN/CF+WBg8GjSJbnBveG76VZQuNRAAgsjm9VuW8QPSD96NAMN12I8FmJQw1iyFUyNcTURXLI5m/aVBtg=
X-Received: by 2002:a1c:770e:: with SMTP id t14mr138271wmi.34.1603900996245;
 Wed, 28 Oct 2020 09:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <BN7PR21MB1681B468C469920E5E65F383AB170@BN7PR21MB1681.namprd21.prod.outlook.com>
In-Reply-To: <BN7PR21MB1681B468C469920E5E65F383AB170@BN7PR21MB1681.namprd21.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 28 Oct 2020 09:03:04 -0700
Message-ID: <CAH2-KxDiL+qs2DNE-NjZaYmBUmXzz23zFeELtpP+m5CMAk8VOQ@mail.gmail.com>
Subject: Re: Entity Manager ReScan Functionality
To: Rahul Kapoor <rahulkapoor@microsoft.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 27, 2020 at 7:31 PM Rahul Kapoor <rahulkapoor@microsoft.com> wrote:
>
> Hi,
>
>
>
> I have noticed that in its current state the entity manager ReScan function does not detect changes in the exposed configuration data unless the configuration name property in the JSON is changed. Is my understanding correct?
>
> I am currently working around this by updating the Name property along with each object within the exposed data since Redfish bmcweb interface only reports objects associated with latest configuration. But I am sure there is a better way

I've read the above a couple of times, and I'm still trying to make
sure I understand;  You're modifying the config files on disk, then
calling rescan and expecting them to be re-read?  If I have that
right, that's not how that works, and would be undefined behavior even
if it did work.  Entity-manager is expecting that the config files are
fixed for the lifetime of a service.  If you're doing this for testing
purposes, a simple systemctl restart entitymanager.service would
reload the files from disk and reinit all configurations, but as a
matter of practice, a system should not be modifying the config files
at runtime.  If you need that behavior, use the dbus interfaces to
modify parameters on dbus, and entity-manager will persist them for
you.

>
>
>
> -Rahul
