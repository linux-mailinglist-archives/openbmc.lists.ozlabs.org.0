Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADBBA64799
	for <lists+openbmc@lfdr.de>; Mon, 17 Mar 2025 10:36:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGVGY3Z9tz3brm
	for <lists+openbmc@lfdr.de>; Mon, 17 Mar 2025 20:36:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742204178;
	cv=none; b=CH9wA4gUw3p4pWQfXXgM38zSfHz8SHv4DOk6te48uMucims4Y323zAEI5cAkQVd1POiFn6OT0cFsQ2O4xRSzwThQWRoFt4YLr+OWsB2GvLKugFxf1PfhF/pxn9ngkDwAw4R3zHScTQr6gU9n2jFquH5jwx3KWVsQI+Qqny76c4/c5nGdvNdeEvpIWj1BzO+j3HFRZRnKUP4veF6KIZ54liGIE92BSt9r/fiObCJX4Be/oAIFYg0KPsutzEwEfqJYlKIqQoH66GcaXCrJJ6RLTcIYPfqRw2DxmGAkLI65WP4ivxLJSqz0aJugqqEHznFZoNHxD8dEMLTmWVeKim7edw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742204178; c=relaxed/relaxed;
	bh=WCavYjFk06W9vGfj8QfgH6N6sZjQBYCL+2wXRSk1N0E=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NW6CZmW2dC9GkVMo5nhKitNbDn1B5t38A1yrY3LCyjC4TqjV+9fqK4WxEsRiiH4MQv2FC+2OQGaOIGrs/j9IfGANulI2Ly1X2O/pAPAW619RKuWW79kcQyT0JoSWIk99ZrRai8YJG7tIdlv8h/10sTweD3lS6MzuveOaTtzsQ+uXbrrzn9Sc6sSiuljCwcAMj/1UbGDWlBhNSvArt+if6eRlIjbRFUdazodAd+Dkrw0xRbf1mMIgLy1BeAtO+oL+QVh48oIb2aUhAwL5ZBZe/YyC3PdbWanx9tC+APfw13RjDV7LYYCCUefmZzpdcmAABikIQzezJ4qvZl+lQkgCIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h/6Nr4KK; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h/6Nr4KK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGVGR1gCqz2yfP
	for <openbmc@lists.ozlabs.org>; Mon, 17 Mar 2025 20:36:13 +1100 (AEDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso46748621fa.0
        for <openbmc@lists.ozlabs.org>; Mon, 17 Mar 2025 02:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742204169; x=1742808969; darn=lists.ozlabs.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WCavYjFk06W9vGfj8QfgH6N6sZjQBYCL+2wXRSk1N0E=;
        b=h/6Nr4KKzX9jBQ08Ax4WknVBjT3ffGVJ0LY8j/UCiwZGGH58QJ1/nPVo5PgNlT+CD3
         oo5IxtAWp+I8JhPoPiknJHtl/5JRFi3GtF0MH+jYw/mlUQQCUymqzRSiew27O8e+spy5
         u06OXx3MhOKknsJ/kC2NtiwkxIrk3Rj3kvwM9/Yqa9MNiv7hW5oVZTKMpKhe9C5SgNdl
         +xYM+SybY6BM3jqiIwCBBQDj2v8y0+HXl+aaZ9RugitHmRc4WDuBRl+yqXF3r6iuH+9C
         knHVhBMX/jQ8dhA5x2zjplfURfpYLVxn5L2XtZVY60H2UNSs0Y76+QgKTB48fSO3P4vF
         bHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742204169; x=1742808969;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WCavYjFk06W9vGfj8QfgH6N6sZjQBYCL+2wXRSk1N0E=;
        b=LqGLcjEQ1b5bzzt6Qvm69huqkpHRSNiIcbREsDqV+xIMwNXs4+lHx9wwVg7Da6y9TO
         xpcIh/tDCrdcn2T0vkWL0t71Lxawm9kmULU//JBmRSEsC8wC8/B29RgXGI7PwCb7BCcj
         /FLnOTPVOWZkTx5oF+IMN0KSudN39++2S4ZVGx8y9v2GWhqQoJzkXsvIDa7B4fG7YRuV
         5iUeDa7VZDM9YtyNSwJrQ8DDrfmDiQW1dFpi4WjlevdCxGemQdy2aqIUp5lt695dOvMa
         6n/gSrMN8G1Z+fKTOPFeADU333y5sbI1iAT3TTCiGymyaINnivfRWMw4UQw/DdRZFTKj
         JGNA==
X-Gm-Message-State: AOJu0YwliKsnxuzBC/R1q5zLfp6MM0M5yuty3F7/40I1n0msttuDG3zn
	RRgv8HFMvUE4XGm48r4W35W915S9p2Xwrjty2Ca+9AzjFUs1noAEPvnh4w==
X-Gm-Gg: ASbGncsCDXoLr7ySSwEIcd0ij8l2WevpvgEtMed3IZJYbHqrCOXLgvMv0HyaHhKHBsy
	EpE0Ijna9rp/RP4K7XPlvIFjsA4SlYVlBdu/bYI5aOvVQ2vOSrralMNCPYwFzQ8tVFOaL5zezt9
	Sek2fIKFy1F1CRAgLSwHa+kvUxbI0uqojnq/siUjoMh4xXlzj5nby7HB3FcXcStGUczoJGfESYO
	DtNhbmKOGZMuDmAznOSVSmkBfeWpBk8Al7N+CWyELM/m83JZY9fSDvA373opXKy1leCqKW5czUm
	G1YrbvcpB0MiDlUMdJyf+7u0vp5K7rIuQZ02fhYnr8GU3Ti5r/kRg2o5VgA=
X-Google-Smtp-Source: AGHT+IEjURjscvz14yC7HXCMBdNDbPFF/S8GrVsyujwFBvsClubly0UB1d08hdKUZpIurbTtbOxUYw==
X-Received: by 2002:a05:651c:19a9:b0:30b:9813:b010 with SMTP id 38308e7fff4ca-30c4a8e4055mr65655561fa.31.1742204168616;
        Mon, 17 Mar 2025 02:36:08 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0ea448sm14467191fa.43.2025.03.17.02.36.07
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 02:36:08 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22+deb11u3) with ESMTP id 52H9a4CK028646
	for <openbmc@lists.ozlabs.org>; Mon, 17 Mar 2025 12:36:05 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 52H9a4pi028645
	for openbmc@lists.ozlabs.org; Mon, 17 Mar 2025 12:36:04 +0300
Date: Mon, 17 Mar 2025 12:36:03 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: Settings backup and restore tool prototype using Ansible -- RFC on a
 published project
Message-ID: <Z9ftA+zMr2ljEbZg@home.paul.comp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

I was thinking about an "ideal" way to allow backing up and restoring
the BMC configuration in production and came up with this set of
goals:

1. The saved config should be easy to inspect and change;

2. It should not require any additional changes on the BMC side, so
   should be usable not only with OpenBMC but also with other
   implementations;

3. The tool usage should be easy to automate;

4. The tool should be easy to integrate into larger management
   systems and it should scale to arbitrary amount of BMCs;

5. It should be as beneficial as possible to the communities using
   Free Software.


To my surprise I couldn't find any existing solution so following
these ideas I prepared a prototype and published at
https://github.com/paulfertser/ansible_redfish_settings .

Please feel free to comment on approach and the implementation, and of
course to provide patches. I have to note I'm not personally herding a
bunch of servers so my notions can be quite off, do not hesitate to
point out when it doesn't match real life usecases.


Point 1 is followed by saving config in YAML format, that's nice to
edit both manually and automatically if needed. Point 2 is fulfilled
by doing only Redfish interactions, optional Oem settings can be added
conditionally. Points 3 and 4 come naturally from using Ansible which
seems to be the most popular system for reproducible mass
configuration (and much more), so should be familiar to most BMC
operators. Point 5 is helped by repository organisation which makes it
natural to submit patches upstream to community.general Ansible
collection.


While working on this prototype I contributed few changes for missing
functionality in community.general collection, the experience was
highly positive as the upstream is welcoming and helpful. So extending
the project to handle the settings you care about shouldn't be
problematic, see my changes for example:

https://github.com/ansible-collections/community.general/commit/e853bdf6f907872fdd39e8c507061269399942e9
https://github.com/ansible-collections/community.general/commit/129f51cf9d284d107cf197a1805481c2e4645efe
https://github.com/ansible-collections/community.general/commit/abe4e5ce95e6cae4a42629640345e0769c3724a1


Here follows the copy of the project README.md with some more details.

# Description #

This project aims at providing an easy to use mechanism for creating a
human-readable and editable BMC settings configuration bundle and for
reliable idempotent application of them to an arbitrary number of
machines. It should be possible to use it directly or to seamlessly
integrate into larger Ansible playbooks as desired. The tasks files
are provided under MIT licence terms.

Added as a submodule is a fork of community.general Ansible
collection. The changes are minimal: extending backwards compatibility
and renaming to not clash with system-wide installation. The idea is
to provide fast, easy and straightforward mechanism to prepare and
test patches for submitting Github pull requests to upstream
repository: https://github.com/ansible-collections/community.general .
After the PRs are merged it's trivial to rebase to get the
latest-and-greatest code. Please note this collection is published
under GPL-3.0.

The testing was performed against OpenBMC hosts but it should be
working reasonably with any other Redfish compliant server.


# System requirements #

Ansible version 2.10.0 (released in 2020) or later.


# Installation instructions #

```
# apt install ansible
$ git clone --recursive https://github.com/paulfertser/ansible_redfish_settings
```

If you really need a fully "standalone" solution, consider packaging with
Nuitka as described here: https://github.com/HexmosTech/Ansika .


# Usage examples #

Example command to retrieve all the settings from a single host:
```
$ ansible-playbook get_settings.yaml --extra-vars "baseuri=172.41.1.38 username=root password=0penBmc"
```

The data will be saved to `settings_172.41.1.38.yaml` file.

Example command to set settings for a single host:
```
$ ansible-playbook set_settings.yaml --extra-vars "baseuri=172.41.1.38 username=root password=0penBmc"  --extra-vars @settings_172.41.1.38.yaml
```

The repository includes sample `inventory.ini` which allows to retrieve and set
settings en masse:
```
$ ansible-playbook get_settings.yaml -i inventory.ini
```

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
