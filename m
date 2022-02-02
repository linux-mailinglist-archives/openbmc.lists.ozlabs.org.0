Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A65E14A7C05
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 00:58:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpzJg35Kmz3bb0
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 10:58:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=TghQNA5l;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42d;
 helo=mail-wr1-x42d.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=TghQNA5l; dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpzJF2CG8z2yNr
 for <openbmc@lists.ozlabs.org>; Thu,  3 Feb 2022 10:57:47 +1100 (AEDT)
Received: by mail-wr1-x42d.google.com with SMTP id k18so1522751wrg.11
 for <openbmc@lists.ozlabs.org>; Wed, 02 Feb 2022 15:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NCJfKscuOk7gtssLvLvVSG9t0hANyGXeVsep/0rCeCo=;
 b=TghQNA5laMG46uPVuUiYOV2EUBdeyaOY0kjwLLSsZMqjdpdIyj1n9m40niqM4V4Maz
 YVYLoaoJOgPQfDZiWe5r84ZGbeQN1W0tXJgu0EwSHTuuvYjjJB97fuF6s8pfRa44+D3T
 UOJgjkSxYo/HhU9RuQC9Ye/Cr0wUGnfVs8hPvXMOfJ/GO2D8jpoSBS7fStFxm4Yn9duK
 iTg4LIg6qUrGoNVxLxFF7klZ87XX4ypFqjkfmrFJzUBgJdNnmBlW8GrM2rL9bNph9nmO
 XItazOqNbFWMfJ6hLO+qaVvqy+xpV2/M8Ou6Wh31EZ2UaRlBB7yaJVszQlj2ZshKiG2I
 M6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NCJfKscuOk7gtssLvLvVSG9t0hANyGXeVsep/0rCeCo=;
 b=yuQKBLSKQBRkXL3uu8anOoJvflkdh2taYvJPRuUnUxKVrAFD3twMbiEcro+g/qc75Y
 W+ShtmrI7PAeJtqkFh2WLhmS/m9jbIfM6OEIqd4feUuYKkTUTyf8ubsKM6W/63aIi3EF
 Wsw2M82vZK14+x8flnToyZI3L71J9qXZ5JYmTPFuT+sdHtTfAAs33G/5xX/40UCiqZe+
 YC2wkUf3a45+AjjyfmJ4ZiHHHzKzZCGaX5Ai60HaOpmir27Mtx8DknqA5Ypb4/q1MVTd
 x01Ae+L3g3Bu9oCwhtebW/1I857o6XiHKw0NeosLhhF9HgbrpVNhESWmsjycu4+sswTt
 Z9zQ==
X-Gm-Message-State: AOAM531HZQP9nF9cfVafIgjePd9axHd9STozXs9BqclfDvDnZBb9eX64
 x8lOxRfLtLTUckFqrFAtQRzIeMiv2U8nMJNdVhsODA==
X-Google-Smtp-Source: ABdhPJz1Lw/OE6+4ZiHsZt4mTFs2a8Yb2dsOtbIdpFqHMA4Otz8+gK3hXeNyYHLPt2QREIm395crTkhR4LodHG0WqwQ=
X-Received: by 2002:adf:ea41:: with SMTP id j1mr641960wrn.112.1643846260430;
 Wed, 02 Feb 2022 15:57:40 -0800 (PST)
MIME-Version: 1.0
References: <52bab6e6-0288-2cd6-ae32-b3ba9b89d0c7@intel.com>
In-Reply-To: <52bab6e6-0288-2cd6-ae32-b3ba9b89d0c7@intel.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 2 Feb 2022 15:57:29 -0800
Message-ID: <CAH2-KxDabD2bsxpuYyUhw0bD-oLc+bbW+SCpLPtooWO4N50--A@mail.gmail.com>
Subject: Re: OpenBMC DHCP Management
To: Johnathan Mantey <johnathanx.mantey@intel.com>
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

On Wed, Feb 2, 2022 at 11:07 AM Johnathan Mantey
<johnathanx.mantey@intel.com> wrote:
>
> OpenBMC DHCPv4 and DHCPv6 management
>
> I wish to solicit input concerning DHCPv6 handling in OpenBMC.
>
> Background:
>
> Some time ago I submitted and merged changes that allowed IPMI and
> Redfish to enable IPv6 Routing Advertisement. This permitted Stateful
> IPv6 address assignment to occur.
>
> Fast forward to today and the Intel QA group is identifying
> misbehavior in how DHCPv6 is controlled, and state reported. Most of
> the issues appear in the IPMI stack. I am also certain the Redfish
> support is lacking. The phoshpor-network layer does not properly
> control the systemd-network DHCPv6 configuration in a way that allows
> Stateless DHCPv6.
>
> Issues:
>
> OpenBMC uses the systemd-networkd networking stack. The
> phosphor-network code uses D-Bus to get configuration changes from
> user space. It updates the systemd.network configuration file to
> change the state of the network interface. Within the systemd.network
> configuaration file is an entry named "DHCP". This entry, at first
> glance, appears to control IPv4 and IPv6 DHCP. It is also the primary
> configuration entry for reporting DHCP state back to IPMI/Redfish
> about the current DHCP configuration in use by systemd-networkd.
>
> The problem is the "DHCP=" entry does not accurately reflect DHCPv6
> state. Even with "DHCP=v6" assigned it is possible DHCPv6 is not
> active. This entry can really only accurately describe the DHCPv4
> state.
>
> DHCPv6 state is accurately described by the combination of
> "IPv6AcceptRA" and the associated "DHCPv6Client" entries. The
> IPv6AcceptRA control is exposed via D-Bus, DHCPv6Client is not. The
> IPv6 state is reflected in these combinations:
> IPv6AcceptRA=true DHCPv6Client=true  : Stateful IPv6
> IPv6AcceptRA=true DHCPv6Client=false : Stateless IPv6
> IPv6AcceptRA=false                   : DHCPv6 disabled
>
> OpenBMC does not have complete control over these states, nor does it
> accurately report the state of DHCPv6. A first attempt to accurately
> report DHPCv6 state was made in this commit:
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-networkd/+/48040
>
> The commit was not approved, which I agree is the correct
> response. The changes bandaged over a larger issue.
>
> Proposal:
> I have begun coding a change to address the issues described. My
> concern is the changes are going to impact four separate repositories,
> specifically:
>
> phosphor-dbus-interfaces
> phoshor-network
> bmcweb
> phosphor-ipmi-host
>
> As such I want to get some feedback on my plan before expending too
> much effort.
>
> My current plan:
> 1. Modify phosphor-dbus-interfaces, changing the DHCPConf entry in
>     EthernetInterface. I propose adding two more DHCPConf
>     enumearations:
>     name: both             # DHCPv4 enabled, DHCPv6 Stateful enabled
>     + name: v4v6stateless  # DHCPv4 enabled, DHCPv6 Stateless enabled
>     name: v6               # DHCPv4 disabled, DHCPv6 Stateful enabled
>     + name: v6stateless    # DHCPv4 disabled, DHCPv6 Stateless enabled
>     name: v4               # DHCPv4 enabled, DHCPv6 disabled
>     name: none             # DHCPv4 and v6 disabled
>
>     The goal is to permit phosphor-network to take the correct actions
>     needed to update the systemd.network file.
> 2. Deprecate the IPv6AcceptRA boolean. This, in my opinion, leaked too
>     much information about how systemd-networkd managed IPv6 dynamic
>     addressing.
> 3. Modify phosphor-network to accept the new DHCPConf entries, and
>     update the systemd.network configuration file based on the higher
>     level mode.
> 4. Update BMCWeb to use the new D-Bus configuration values

I don't understand enough about the above dbus/dhcp changes to have an
opinion on the interface changes, but for bmcweb so long as we
maintain the same Redfish-client API behavior (which I'm assuming it
will), I have no problem with bmcweb being updated to the new APIs
above.  Looking forward to seeing the patches.


> 5. Update phosphor-ipmi-host to use the new D-Bus configuration values
>
> Conclusion:
> The changes suggested abstract the reporting and the modification of
> DHCPv6, and eliminate implementation specific details from the IPMI
> and Redfish clients. They also fill in a gap with Stateless IPv6
> assignment.
>
> --
> Johnathan Mantey
> Senior Software Engineer
> *azad te**chnology partners*
> Contributing to Technology Innovation since 1992
> Phone: (503) 712-6764
> Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>
>
