Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FE943F351
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:07:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgLn50Zx6z3c7Y
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 10:07:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgLmp6wf4z2yLq
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 10:07:22 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="230491750"
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="230491750"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 16:05:59 -0700
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="636415523"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.54.51.82])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 16:05:58 -0700
Date: Thu, 28 Oct 2021 16:05:57 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Ed Tanous <edtanous@google.com>
Subject: Re: bmcweb non-standard OEM integration
Message-ID: <20211028230557.GE1786414@mauery.jf.intel.com>
References: <20211027043751.GB1786414@mauery.jf.intel.com>
 <CAH2-KxDa=vPjOxpq9fnC85azUTmdre1TaxEtb8m7isaTU0Fhpw@mail.gmail.com>
 <CAH2-KxBFDc0VvSxovJxSDZcGQhzuy-do56SVFmbvgg05DAVD7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH2-KxBFDc0VvSxovJxSDZcGQhzuy-do56SVFmbvgg05DAVD7Q@mail.gmail.com>
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
Cc: Development list for OpenBMC <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 27-Oct-2021 03:28 PM, Ed Tanous wrote:
>On Wed, Oct 27, 2021 at 9:22 AM Ed Tanous <edtanous@google.com> wrote:
>>
>> On Tue, Oct 26, 2021 at 9:37 PM Vernon Mauery
>> <vernon.mauery@linux.intel.com> wrote:
>> >
>> >
>> > We want to move away from patches.
>>
>
>Given this is your goal, let's enumerate these patches to see if
>there's a way to get the easy ones knocked out, and get next steps for
>all of them.  Overall, I see a lot of half-finished things, or things
>that the submitters abandoned immediately after opening the patchset
>upstream.  A lot of them could be upstreamed with pretty minimal
>rebase and rework.

This all started as an internal discussion about the mounting technical 
debt of carrying patches internally for upstream projects. We did a 
similar categorization ourselves.

>As a layman's analysis of this, most of the problems don't seem to be
>OEM schemas, and fall into a couple categories:
>1. Patches already on master, just need to rebase.

Yes. I am trying to push a mindset internally that the feature is not 
complete until it is accepted upstream.

>2. Standard features that make assumptions about specific addresses,
>parts, and names on Intel systems.  I'm not sure how we would get
>these into upstream given that we need to support more flash chips and
>naming conventions than just those that Intel uses.

This is the kind of thing where it is an OEM patch, but maybe not an OEM 
schema. The proposal will need to make room for this code as well.

>3. Patchsets that reimplement things that exist in the standard.  I
>think in general we don't want to duplicate things already covered in
>the standard, but I'm happy to have a discussion if your opinion
>differs.

If the resulting output differs from the original code, we need to have 
a discussion on why. It may be that some of this code is actually the 
same as #2. If the output is the same, but the implementation is 
different, this is just code that should be removed.

>4. Patchsets that were submitted, then after review never received any
>other response from the submitter.  In some cases these just required
>minor rework to make them usable on master, then would've been fine.

Again, this is part of nurturing the changes until they are accepted. It 
is work, but it is current work instead of future work.

I appreciate all the detailed feedback below. I will try to see if we 
can at least reduce the size of our internal patch tree by following 
your recommendations.

--Vernon

>./0001-Firmware-update-configuration-changes.patch
>I talked about this one previously on this thread.  Check out the DMTF
>proposals for this.
>
>./0002-Use-chip-id-based-UUID-for-Service-Root.patch
>This is reading the chipid directly from the filesystem, and hardcodes
>both the chipid and offset specific to intel systems.  The feature is
>novel and would be useful, but I think needs rolled into its own
>application that bmcweb can grab from so that bmcweb isn't directly
>talking to hardware, and other systems can override with their own
>specific UUID implementations.  For the moment, bmcweb generates the
>Redfish UUID internally, so if this patch were submitted today it
>would break a majority of systems.  Re-develop it to not do that, and
>it seems like something we could have on master.
>
>./0010-managers-add-attributes-for-Manager.CommandShell.patch
>This one was submitted here, but rejected because it would be
>incorrect for some systems and effectively break them.  Next steps
>involve not hardcoding this data for all systems and relying on a dbus
>interface to determine the presence of a serial console, which we
>already have helper functions to do.
>https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/38331
>
>./0011-bmcweb-Add-PhysicalContext-to-Thermal-resources.patch
>This one relies on intel's specific naming of dbus paths to generate a
>standard property "PhysicalContext".  If that works for Intel, it
>seems like it needs to stay a patch, but should be relatively easy to
>come up with a solution that all systems could implement that didn't
>effectively search for specific names.
>
>./0012-Log-RedFish-event-for-Invalid-login-attempt.patch
>This patch looks reasonable (a couple minor things present that need
>fixed), I just don't think it was ever submitted.
>
>./0013-Add-UART-routing-logic-into-host-console-connection-.patch
>This is directly opening a hardcoded uart on a client connecting, and
>directly writing hardware from bmcweb, which is a big design
>anti-pattern.  If this is needed, this feature needs to go into
>phosphor-console, and not hardcode the specific uart address.
>
>./0014-recommended-fixes-by-crypto-review-team.patch
>99% of this looks like "apply mozilla modern cipher rules", which we
>used to have a config option for, but nobody used it and it got out of
>date.  If this is something you want to see, let's get it behind some
>compiler flags, and backed by a security authority like Mozilla, then
>this should be fine to submit.  That should at least minimize the
>patch down to "places where Intel security teams disagree with
>mozilla" which I would hope would be minimal.  Send this to gerrit as
>is and we can talk about it more.  There might be other options for
>making some of this compile time configurable.
>
>./0015-Add-state-sensor-messages-to-the-registry.patch
>This was submitted here:
>https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/40047
>and was abandoned 6 months later when the submitter never replied to
>the first round of comments.  Not sure how I can help more on that one
>
>./0017-Add-msg-registry-for-subscription-related-actions.patch
>This looks like it's duplicating the Resource registry items, which
>aren't specific to Event subscriptions, and much more useful.  It's
>not clear why you would want to go this route, and the commit message
>doesn't talk about why this route was chosen.  If you want to submit
>this as-is, we can talk more about it in the review.
>
>./0018-bmcweb-Add-BMC-Time-update-log-to-the-registry.patch
>Got submitted here:
>https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/42880
>And is waiting on a response from the author.
>
>./0019-Add-generic-message-PropertySizeExceeded.patch
>This is making edits to a DMTF owned message registry.  Per the spec,
>we can't make modifications to DMTF owned registries, although in DMTF
>these types of new messages seem to get in easily, so it seems likely
>that you could upstream it to DMTF, or rewrite the patch to put it in
>the correct registry.  With that said, it adds code which isn't used
>anywhere, so it's not clear why it's needed.
>
>./0020-Redfish-Deny-set-AccountLockDuration-to-zero.patch
>This was never submitted, but this kind of business logic and validity
>checking needs to go into phosphor-user-manager, not bmcweb, otherwise
>we'll duplicate the logic in both bmcweb and ipmi.
>
>./0021-Add-message-registry-entry-for-FirmwareResiliencyErr.patch
>This patchset is already merged here:
>https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/43280
>Maybe it's just waiting on Intel to Rebase?
>
>./0023-Add-get-IPMI-session-id-s-to-Redfish.patch
>This is currently in review here:
>https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/37785
>And is waiting on a response from the submitter.  Last response from
>Gunnar on August 4th was "I am still really struggling with why we
>want this myself."  I have similar concerns.
>
>./0024-Add-count-sensor-type.patch
>This adds a new type of sensor not in phosphor-dbus-interfaces, which
>also goes somewhat against what we've been doing for other counters,
>but let's get the commit open against PDI and start discussing.  The
>bmcweb patchset itself is pretty trivial once we have an agreement on
>how counters will work in dbus.
>
>./biosconfig/0001-Define-Redfish-interface-Registries-Bios.patch
>./biosconfig/0002-BaseBiosTable-Add-support-for-PATCH-operation.patch
>./biosconfig/0003-Add-support-to-ResetBios-action.patch
>./biosconfig/0004-Add-support-to-ChangePassword-action.patch
>./biosconfig/0005-Fix-remove-bios-user-pwd-change-option-via-Redfish.patch
>
>This whole series of patches got submitted and effectively abandoned
>(they might still be open) because they didn't implement the Redfish
>Registry versioning requirements properly.  Implement that properly,
>and I suspect others will want to see this on master as well.
>
>./bmcweb.socket
>I have no idea why Intel duplicated the socket file locally in their
>meta layer;  It looks roughly the same as upstream (although upstream
>can now template configure the port).  I suspect this can be removed?
>
>./eventservice/0001-EventService-Fix-retry-handling-for-http-client.patch
>This is already present on master.  Still waiting to rebase?
>
>./eventservice/0002-EventService-https-client-support.patch
>This has security issues that were pointed out in the review.  Namely,
>it fails to verify certificates, which defeats the point of adding SSL
>support.  Once that gets fixed, along with the other comments in the
>review here, this should be fine to add to master, but I had to
>abandon it because the submitters never replied to comments and the
>lack of feedback made it too much effort to review (it made it to
>patchset 45 with almost no responses before I abandoned it).  I left a
>note that once they replied to the comments they could reopen it, but
>that never happened:
>https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/31735
>
>./eventservice/0004-Add-Server-Sent-Events-support.patch
>./eventservice/0005-Add-SSE-style-subscription-support-to-eventservice.patch
>./eventservice/0006-Add-EventService-SSE-filter-support.patch
>
>The SSE stuff had to be disabled on master because it didn't handle
>errors and was trivial to cause bmcweb segfaults from outside the
>system.  If that's been fixed here, submit the above patches and we'll
>get it re-enabled.  Alternatively, we could enable it under a
>bmcweb-unsecure option if you aren't worried about the security
>consequences.
>
>./eventservice/0007-EventService-Log-events-for-subscription-actions.patch
>This looks like it's duplicated with
>0017-Add-msg-registry-for-subscription-related-actions.patch, and has
>the same answer.  Use the Resource registry that already exists in
>dmtf redfish.
>
>./eventservice/0008-Add-checks-on-Event-Subscription-input-parameters.patch
>This patch looks mostly fine, but was never submitted.  Get it
>submitted and we'll get the minor things cleaned up and on master.
>
>./eventservice/0009-Restructure-Redifsh-EventLog-Transmit-code-flow.patch
>This needs some cleanup (some of which is already on master) then this
>looks fine.  It looks like it's just a bunch of error checking and
>handling, which is a good thing in general, but I've never seen it
>submitted.
>
>./telemetry/0001-Add-support-for-MetricDefinition-scheme.patch
>./telemetry/0002-Sync-Telmetry-service-with-EventService.patch
>./telemetry/0003-Switched-bmcweb-to-use-new-telemetry-service-API.patch
>./telemetry/0004-Add-support-for-MetricDefinition-property-in-MetricReport.patch
>./telemetry/0005-Add-DELETE-method-for-MetricReport.patch
>./telemetry/0006-Add-GET-method-for-TriggerCollection.patch
>./telemetry/0007-Revert-Remove-LogService-from-TelemetryService.patch
>./telemetry/0008-event-service-fix-added-Context-field-to-response.patch
>./telemetry/0009-Generalize-ReadingType-in-MetricDefinition.patch
>
>The telemetry patches have been difficult, because originally they
>were submitted in series, so they're slow to review.  0001 and 0005
>are already on master.  The rest have had varying degrees of design
>discussions that revolve around getting further clarification on the
>redfish specification, and how/if we should implement caching.  In the
>first revision, they also choose to reimplement a number of things
>that bmcweb already had abstractions for, so the submitters were asked
>to clean that up before they merged, and that took quite a bit of
>time, although we're still making progress.
>
>./vm/0001-Revert-Disable-nbd-proxy-from-the-build.patch
>./vm/0002-bmcweb-handle-device-or-resource-busy-exception.patch
>./vm/0003-Add-ConnectedVia-property-to-virtual-media-item-temp.patch
>./vm/0004-Invalid-status-code-from-InsertMedia-REST-methods.patch
>./vm/0005-Set-Inserted-redfish-property-for-not-inserted-resou.patch
>./vm/0006-Bmcweb-handle-permission-denied-exception.patch
>./vm/0007-Fix-unmounting-image-in-proxy-mode.patch
>./0016-Fix-bmcweb-crashes-if-socket-directory-not-present.patch
>These are patches against the nbd backend that never got upstreamed,
>so I don't really like accepting patches for dead code.  Several
>attempts have been made to reach out to the authors to figure out what
>the upstream plan for the nbd backend should be, given it's unusable
>in upstream, and I haven't heard any responses.  Currently this whole
>module is slated for "possible removal", and is uncompilable on
>master.  Ironically patch 0001 comments that line back in, so I know
>that someone at intel has at least seen and groked the comment left,
>and directly decided that it wasn't on their priority list to upstream
>anything.  Hopefully your email above implies that this isn't the
>general policy, and Intel is looking to upstream it?  Let's get a
>discussion started there.
>https://github.com/openbmc/bmcweb/blob/9d832618c74052bd445d6e8b3461946f3c431ca3/meson_options.txt#L7
>https://github.com/openbmc/bmcweb/issues/188
