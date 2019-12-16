Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0624211FE61
	for <lists+openbmc@lfdr.de>; Mon, 16 Dec 2019 07:09:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47brT32W0tzDqTY
	for <lists+openbmc@lfdr.de>; Mon, 16 Dec 2019 17:09:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::235;
 helo=mail-lj1-x235.google.com; envelope-from=karo33bug@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="H6e4zozq"; 
 dkim-atps=neutral
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47brSD17P6zDqTJ
 for <openbmc@lists.ozlabs.org>; Mon, 16 Dec 2019 17:08:42 +1100 (AEDT)
Received: by mail-lj1-x235.google.com with SMTP id m6so5437352ljc.1
 for <openbmc@lists.ozlabs.org>; Sun, 15 Dec 2019 22:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aEg+T0h2hf8px2wfYjqZFjcv4P119YJ534mj5f3kL+4=;
 b=H6e4zozqQmLfLD42V+i7En/87KdMQ2LZzPXf24NBYj2t70LjKzeIbDCb58Xwm5QSmK
 T/+mYBrRFDelbx/wcJv4FxUXXE3mg6NT+ODVLzTzI1Cvi4ofCi5lCtWlWBP1kFMikhat
 lJ+D7Mn4i+BmSfHphLmbNCJOdvKP6wBLkO69DOycbuCfbHrawPahjJTqAw5gCe+7DsPO
 WQuco1gDxkWP2CA57Wv0QBIF47GbhFhA/iR9QGkr6AWDXN6mefrIYLc+g/PQXeBLPNeg
 CZ9FBN/aBL1+FRcEgLu5duCnGV33GlHLo9rtDT1CrW+dv1nwo384PClDqRSirvnbDqpk
 nE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aEg+T0h2hf8px2wfYjqZFjcv4P119YJ534mj5f3kL+4=;
 b=Y76DKKhwGtBMEE1BtX5WMv1TyR+QglK2bzQDciLLAJ4UNK50hf+2VyIkgXZK4swL3t
 2sxYW0om3H+JuUKnGlyuPOuBjeuYS+QhOo2iZU3JaPzUHoNmnW5/nbYsznOO2+sFKhGf
 FzH4RSPQft8MTQcz2ukCUerAGOQKYTHLFxblZdf+OH2oYYKxrDT40gnzhbcwM1E9Y/mw
 l/cngKoAuv5YSSFl+LtvnHvtM+P8D4Gl+h2TZdnEmmVUG54Efrm13ZjlCLrbmou9KLE8
 ZlW45ycG20L6vKLqyvj3Vew9iolBIxm2Aj9DgHO2dOXoy7FAOzK3Qnfoeq8RVULmLROq
 +ApA==
X-Gm-Message-State: APjAAAUej6h4aDPMpWX4v8fpjT49ByTCS5nW1OfVVlF8sdQJpvxFnqIS
 mxc5/V5i0YEvZVdd7VdrzkZZckax1zN5KyFxQCk=
X-Google-Smtp-Source: APXvYqyhCE+F0y0IgRotLuVaBxlvgNxhE1r+IEJHYlJLG2T2JJRUVY2gG21bR8f6kKAlLNUJ7wqYxiS4q8kyOPCl3pA=
X-Received: by 2002:a2e:99cd:: with SMTP id l13mr18216973ljj.243.1576476516336; 
 Sun, 15 Dec 2019 22:08:36 -0800 (PST)
MIME-Version: 1.0
References: <CALzeG+-bxR0oqA_h8Gaf-RQLJygL1QYXy3y2DU=GKdLC9nhWhw@mail.gmail.com>
 <aa329f9e-9e66-d5e7-ecac-e54c23e16a48@linux.ibm.com>
 <d6b94dbe-a6c5-1b19-63e7-1695c3794e78@linux.ibm.com>
In-Reply-To: <d6b94dbe-a6c5-1b19-63e7-1695c3794e78@linux.ibm.com>
From: Carol Wang <karo33bug@gmail.com>
Date: Mon, 16 Dec 2019 14:08:25 +0800
Message-ID: <CALzeG+-dbvwLseu9agpKp5L8vVkNMabM76UOmuDo2sh0uS_qFA@mail.gmail.com>
Subject: Re: Redfish: Disable/enable out of band IPMI
To: Joseph Reynolds <jrey@linux.ibm.com>, "Puli,
 Apparao" <apparao.puli@linux.intel.com>
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

I didn't find the code implement about
/xyz/openbmc_project/Control/Service/<object>.
@Puli, Apparao
Has it been implemented already? Where is it?


On Sat, Dec 14, 2019 at 4:07 AM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>
> On 12/13/19 2:02 PM, Joseph Reynolds wrote:
> > On 12/12/19 1:30 AM, Carol Wang wrote:
> >> Hi,
> >>
> >> Looking to implement IPMI Enable / Disable as part of Redfish's
> >> Manager Network
> >> Protocol.
> >> https://redfish.dmtf.org/schemas/ManagerNetworkProtocol.v1_5_0.json
> >
> > Carol, that is good.  We are also looking to implement this protocol,
> > plus the ability to control other services such as Avahi service
> > discovery, and SSH access to the BMC shell.  I hope we can work together.
> >
> > Note that we have discussed this work in the following places:
> > - https://github.com/openbmc/openbmc/wiki/Security-working-group
> > - https://lists.ozlabs.org/pipermail/openbmc/2019-September/018379.html
> > - https://github.com/ibm-openbmc/dev/issues/612
> >
> > With that said, I don't have an answer to your question.  Can someone
> > who knows systemd help us determine the best way to disable/stop and
> > re-enable/start the [phosphor-ipmi-net][2] service?  I think a D-Bus
> > interface to represent the status of the service and be able to
> > control it is expected.
>
> Maybe the D-Bus part is already done?  See [Service Management][3].
> [3]:
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Control/Service/README.md
>
> > I can help with the bmcweb implementation, if needed.
> >
> > [2]:
> > https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-net_git.bb
> >
> > - Joseph
> >> Two ways to get/set the current status of net IPMI:
> >> 1. Add an interface in phosphor-dbus-interface to indicate the status
> >> of net IPMI.
> >> Have a daemon to monitor the status, if the status is changed, then
> >> enable or
> >> disable the net IPMI service and socket.
> >> 2. Check the net IPMI socket state by getData()[1] in bmcweb. If the
> >> state is
> >> "running" or "listening", the net IPMI status is true, otherwise, the
> >> status is
> >> false. Then bmcweb can enable or disable the service and socket.
> >>
> >> Wondering if anyone has any thoughts on this feature, which way is
> >> better.
> >> If add interface, in which daemon this interface should be implemented?
> >>
> >> [1]
> >> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/network_protocol.hpp#L190
> >>
> >> Thanks,
> >
>
