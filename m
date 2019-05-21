Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D6B24682
	for <lists+openbmc@lfdr.de>; Tue, 21 May 2019 05:55:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457MNm5kRRzDqLW
	for <lists+openbmc@lfdr.de>; Tue, 21 May 2019 13:55:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NOz9pT7G"; 
 dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457MNJ2BMYzDqJ1
 for <openbmc@lists.ozlabs.org>; Tue, 21 May 2019 13:54:55 +1000 (AEST)
Received: by mail-qt1-x832.google.com with SMTP id o7so18952346qtp.4
 for <openbmc@lists.ozlabs.org>; Mon, 20 May 2019 20:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iSBLXhywLLlF1wZo7LThgf+fwV7OITg9qWF05PUmtm4=;
 b=NOz9pT7GkpxHBIuO2jXiClbgIkuiKP16N+mANTqyMh/V/NW2lfzJ2euk5Ta046Rl7r
 CjmHMcmF7nF+cWodCWIjAPAhN9fooXIdKfqyrhrXyGkvPMrHmG+VttqmM4mlsIz/MXIt
 R0bs5fLfuvuE+/lrdv55O+efBaNyjiIG1FXu07uQSqG6oea5Fq3+avWdDBN2yhNtDDD2
 Dkd+mqWeTYq8ZHeNvtENguu4tPiemlcLWuNJUxlxPsX4i0Q/Emt1FEeiCEZCLaX6LuQN
 TBnL5TmCY9eMxKZaLtymaqwE1EGTbFQsQtiAxWyzXeY7fJUFoeJ0/C36h1VJeNDMF3jS
 MKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iSBLXhywLLlF1wZo7LThgf+fwV7OITg9qWF05PUmtm4=;
 b=k9/oagc7F9OgjDXSHzMys43Gy/NSRQAsH0s0YMrwWr9ZWH5ZjlskIb8nyCYaVIRSW7
 7bQJuni0tOSp6qbBLukUBKvXKWczFb6HQY1g6nIzAU5zllswHn/nafpNv4mOIPfGYrv8
 FK738zJ831sIxbzWIwTapa8LuaaQAh33wQjsLHWyRrzkTrPVgSR5f3D7411+qCQUwgDG
 U9VCPuUiQS5hGaDJnZklEnUb9p1ieenwoDyETLXYp8FMg8fOuIpC2xr1I7ltp65Lfpwp
 A/ApU1Cfsvubvu+TtGDN4Y/DFqf4Epan8aFuf3Q5DT2nY3l2/oqkJAgilfaPu6FV/G99
 lAGA==
X-Gm-Message-State: APjAAAUa8fo/yoviFNMs+pQ7hL8IczgBim2viz6w171tSz61ES9lQ6u2
 IRGKAxDlxGT+gn7AKcdyCxK1FZ1qKTKXFZ3ZcB4=
X-Google-Smtp-Source: APXvYqytb/kyOtUXCbvJiaMofP7sDdTTB2RmQ7EiMeo31nC7aWy8+wb6cFkxBqCGqSh1AZ5muspfv6J5xcCw+XFMpxc=
X-Received: by 2002:a0c:b5ad:: with SMTP id g45mr37836176qve.231.1558410891553; 
 Mon, 20 May 2019 20:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAG9c7cDx5rw50zK0WnF20PqFFU_pGdDZ1fvk15PASeGeKsH-+w@mail.gmail.com>
 <19be2af8-7b88-5183-44c1-d27fddec29c3@intel.com>
 <CAOUmYFSSzi3Mo7YUh6-rvdJtNj1Bp2BG6+hV8AzMS3SHt9xWRw@mail.gmail.com>
In-Reply-To: <CAOUmYFSSzi3Mo7YUh6-rvdJtNj1Bp2BG6+hV8AzMS3SHt9xWRw@mail.gmail.com>
From: Henbin Chang <henbinchang@gmail.com>
Date: Tue, 21 May 2019 11:54:40 +0800
Message-ID: <CAG9c7cDTTbdC_huucwkEKf5mnaSJoaAUCUrQ3-1YdtVRVcpUSg@mail.gmail.com>
Subject: Re: [phosphor-webui] Enable style-src 'unsafe-inline'
To: Derick <derick.montague@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009af36305895dcfd9"
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
 Ed Tanous <ed.tanous@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000009af36305895dcfd9
Content-Type: text/plain; charset="UTF-8"

Thank Ed and Derick.

We would like to improve the layout of the table, like 'Server health
->Sensors page' of phosphor-webui.
ANd we are looking for the solution to make the table can support 'column
hide', 'sorting by column name' and 'auto-resize for any client device'
it's just like the example in the URL.
http://ui-grid.info/docs/#!/tutorial/Tutorial:%20108%20Hidden%20Grids

The Angular ui-grid  is easy to use and can address our requirement
But it uses the inline style.

We will look for other solution.
Please let me know if you have any suggestion.

Thanks for your help

--0000000000009af36305895dcfd9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank Ed and Derick.<div><br></div><div>We would like to i=
mprove the layout of the table, like &#39;Server health -&gt;Sensors page&#=
39; of phosphor-webui.</div><div>ANd we are looking for the solution to mak=
e the table can support &#39;column hide&#39;, &#39;sorting by column name&=
#39; and &#39;auto-resize for any client device&#39;</div><div>it&#39;s jus=
t like the example in the URL.</div><div><a href=3D"http://ui-grid.info/doc=
s/#!/tutorial/Tutorial:%20108%20Hidden%20Grids">http://ui-grid.info/docs/#!=
/tutorial/Tutorial:%20108%20Hidden%20Grids</a></div><div><br></div><div>The=
 Angular ui-grid=C2=A0 is easy to use and can address our requirement=C2=A0=
</div><div>But it uses the inline style.<br></div><div><br></div><div>We wi=
ll look for other solution.=C2=A0</div><div>Please let me know if you have =
any suggestion.<br></div><div><br></div><div>Thanks for your help</div><div=
><br></div></div>

--0000000000009af36305895dcfd9--
