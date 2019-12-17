Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D2D122248
	for <lists+openbmc@lfdr.de>; Tue, 17 Dec 2019 04:00:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cNF14tfZzDqXW
	for <lists+openbmc@lfdr.de>; Tue, 17 Dec 2019 14:00:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::235;
 helo=mail-lj1-x235.google.com; envelope-from=karo33bug@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="j75c8GRX"; 
 dkim-atps=neutral
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cNCx3QJkzDqWH
 for <openbmc@lists.ozlabs.org>; Tue, 17 Dec 2019 13:59:56 +1100 (AEDT)
Received: by mail-lj1-x235.google.com with SMTP id j26so7302ljc.12
 for <openbmc@lists.ozlabs.org>; Mon, 16 Dec 2019 18:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QtbJF9yBObcfikL9UfqvyoXjnNec33D6Tv+e8/OREk8=;
 b=j75c8GRXk0wMrZRvG81vHiF9eZp+eALByBQubhnII/DQFFxponlWMIEtWHoTH81gP2
 pNdPS6bYF5Y45GhoJesHBJeSkI6wLNh5mEz8osXp3uPK/83IJMa4S0Pt3oboqODH4d9c
 Dk+8sLH7SH/nIHkByfMFVWBr4cN5+/dm9PzpDRM1jjKOvcSELll0Mdiza49pGoYCi1AW
 W6AcCKbFmCPuhwvg3ln3Yr4dNGeFVqll96lTB4pmIjVEUhj0diLXeV2fTrlRrSWiSpGM
 C9++m1CR8rqH8n2x7Gkiz6w37Rt/+wAbR6NTa0mOrERfIpsnORsnpeY7tFmf+Cyh/gqW
 BVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QtbJF9yBObcfikL9UfqvyoXjnNec33D6Tv+e8/OREk8=;
 b=Rmq90U9cKykly92o5agMURdc833EXCvgM/N62WD8XOLyp5VBwgHWqhrCS5LbpSFhSW
 Iw3VInXEt5Sb5Lvac++EJLb0ugkTDlB2Jrhz2fU/n7fMpQAJtMfqSu232QPj1OeA0hfd
 LwEPbxwoBzZVnfWZIfuuUWxx2b82F+DkKXegP1bQJkQK3YDz5YdnIhxGXOeP7oKws5uu
 qGqqJFFWm7zlUAEsBRkns8bsyWzlbDAZVzSTudFFDYb1JeEON09fzJgduc8doLeyrOJJ
 sP38rOV7yTzPGqge5LDVcxTBH+7bcphDR7ts3VAaGwgsiAkm0EfhuWme1Nc/7N9a5wtY
 qYRA==
X-Gm-Message-State: APjAAAWyI+76/xNNouASMTWV3G0pQuhPphtdUMmCqjhA1Ti3EcxVOZ1F
 M1Lzkn8j8GfB+dO9kuF3STKkPtIIFJsqQgB1xNU=
X-Google-Smtp-Source: APXvYqyoL1bvtk2u2HCDA3LbK/PBpm6Y+FTzycOGfdu3NWTN6zVEtfJzvfz3qoJLC08ozlwzwck7DVgu1j7ncm5RXcw=
X-Received: by 2002:a2e:3608:: with SMTP id d8mr1563266lja.152.1576551591521; 
 Mon, 16 Dec 2019 18:59:51 -0800 (PST)
MIME-Version: 1.0
References: <CALzeG+-bxR0oqA_h8Gaf-RQLJygL1QYXy3y2DU=GKdLC9nhWhw@mail.gmail.com>
 <aa329f9e-9e66-d5e7-ecac-e54c23e16a48@linux.ibm.com>
 <d6b94dbe-a6c5-1b19-63e7-1695c3794e78@linux.ibm.com>
 <CALzeG+-dbvwLseu9agpKp5L8vVkNMabM76UOmuDo2sh0uS_qFA@mail.gmail.com>
 <696721cc-2cf4-373e-027d-475ff8d357dc@linux.intel.com>
In-Reply-To: <696721cc-2cf4-373e-027d-475ff8d357dc@linux.intel.com>
From: Carol Wang <karo33bug@gmail.com>
Date: Tue, 17 Dec 2019 10:59:40 +0800
Message-ID: <CALzeG+83r=v5G_jiCV2M9XErD3fXiMYcti3zknO-YY3_yL59DQ@mail.gmail.com>
Subject: Re: Redfish: Disable/enable out of band IPMI
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Puli,
 Apparao" <apparao.puli@linux.intel.com>, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Ok, I got it. Thank you!
Waiting for the change then. :-)

On Mon, Dec 16, 2019 at 9:48 PM Thomaiyar, Richard Marian
<richard.marian.thomaiyar@linux.intel.com> wrote:
>
> This came a month back, and i wanted to push the changes in intel repo
> to the OpenBMC community repo, due to other priority missed to push the
> same.
>
> https://github.com/Intel-BMC/provingground/tree/master/srvcfg-manager
>
> Will push the document in few day and the changes for the same.
>
> Regards,
>
> Richard
>
> On 12/16/2019 11:38 AM, Carol Wang wrote:
> > rface in phosphor-dbus-interface to indicate the status
> > of net IPMI.
> > Have a daemon to monitor the status, if the status is changed, then
> > enable or
> > disable the net IPMI service and socket.
> > 2. Check the net IPMI socket state by getData()[1] in bmcweb. If the
> > state is
> > "running" or "listening", the net IPMI status is true, otherwise, the
> > status is
> > false. Then bmcweb can enable or disable the service and socket.
> >
> > Wondering if anyone has any thoughts on this feature, which way is
> > better.
> > If add interface, in which daemon this interface should be implemented?
